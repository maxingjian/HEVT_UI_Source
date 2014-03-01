#include "CanControl.h"

CanControl::CanControl(QObject *parent):
    QObject(parent)
{
    _canRecieve = new CanRecieve;
    _recieveThread = new QThread;
    connect (this,SIGNAL(_can_recieve_start(QString)),_canRecieve,SLOT(can_recieve(QString)));
    connect (_canRecieve,SIGNAL(message_ready(QString,int*)),this,SLOT(_message_ready(QString,int*)));
    _canRecieve->moveToThread(_recieveThread);
    _recieveThread->start();
}
void CanControl::start_up(){
    QString str0 = "canconfig can0 bitrate 500000";
    QString str1 = "ifconfig can0 up";

    QProcess::execute( str1 );
    QProcess::execute( str0 );
}

/*void CanControl::send(QString canMessageID, QString canMessageData){
    QProcess::execute("cansend can1 -i "+canMessageID+" "+canMessageData);
    qDebug() << "Sending diagnostic message";
}*/

int* CanControl::recieve_b(QString canMessageID){
    int* data = new int[8];
    QProcess *process = new QProcess();
    process->setProcessChannelMode(QProcess::MergedChannels);
    QStringList arguments;
    QString temp2 = "canecho can0 -v " + canMessageID;
    arguments << "-c" << temp2;
    //=============
    qDebug()<<"Aquiring Message ID: "<< canMessageID << " (blocking)";
    //=============
    process->start("/bin/bash",arguments);

    // wait 1000 msec for message
    if(process->waitForFinished(1000)){
        QByteArray temp = process->readAll();
        QString message = QString(temp);
        for (int i = 0; i < 8; i++){
            data[i]=message.split("\n")[1].split(" ")[i+2].toInt(NULL,16);
        }
        //============
        qDebug()<<"Message Recieved: "<< message.split("\n")[1] << " (blocking)";
        //============
    }
    // no such can message on the bus
    else {
        process->kill();
        for (int i = 0; i < 8; i++){
            data[i]=-1;
        }
        //============
        qDebug()<<"Message Not Recieved: "<< canMessageID << " (blocking)";
        //============
    }
    return data;
}

void CanControl::recieve_nb(QString canMessageID){
    emit _can_recieve_start(canMessageID);
}

/*int find_low(int temp_value){
    int store_temp;
    if (store_temp > temp_value){
        return temp_value;
    }
    else {
        return store_temp;
    }
}

int find_high(int in_temp){
    int keep_temp;
    if (keep_temp > in_temp){
        return keep_temp;
    }
    else {
        return in_temp;
    }
}

int sum;
int number;
int find_avg(int next_temp){
    number++;
    sum = sum + next_temp;
    return (sum/number);
}*/

void CanControl::_message_ready(QString canMessageID, int *canMessageData){
//    emit message_recieved(canMessageID, canMessageData);
    int vehicleState = canMessageData[0]/16;
    int vehicleMode = canMessageData[0]%16;
    qDebug()<<"vehicleState : "<<vehicleState <<"  vehicleMode: "<<vehicleMode;
    QString operatingMode = "OFF";
    if (vehicleState == 1){
        operatingMode = "ELECTRIC";
    }
    else if (vehicleState == 2 && vehicleMode == 1){
        operatingMode = "SERIES";
    }
    else if (vehicleState == 2 && vehicleMode == 2){
        operatingMode = "PARALLEL";
    }
    emit veh_mode_recieved(operatingMode);
    emit batt_temp_recieved((int)(canMessageData[1]*0.5-40));
    emit batt_soc_recieved((int)(canMessageData[2]*0.5));
    emit batt_current_recieved((int)((canMessageData[3]*256+canMessageData[4])*0.025-1000));
   /* int low = find_low(canMessageData[1]*0.5-40);
    emit batt_low(QString::number(low));
    int high = find_high(canMessageData[1]*0.5-40);
    emit batt_high(QString::number(high));
    int average = find_avg(canMessageData[1]*0.5-40);
    emit batt_avg(QString::number(average));*/
}
