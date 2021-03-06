#include "CanRecieve.h"

CanRecieve::CanRecieve(QObject *parent) :
    QObject(parent)
{

}


void CanRecieve::can_recieve(QString canMessageID){
    int* data = new int[8];
    QProcess *process = new QProcess();
    process->setProcessChannelMode(QProcess::MergedChannels);
    QStringList arguments;
    QString temp2 = "canecho can0 -v " + canMessageID;
    arguments << "-c" << temp2;
    //=============
    qDebug()<<"Aquiring Message ID: "<< canMessageID << " (non-blocking)";
    //=============
    process->start("/bin/bash",arguments);

    // wait 1000 msec for message
    if(process->waitForFinished(5000)){
        QByteArray temp = process->readAll();
        QString message = QString(temp);
        message = message.split("\n")[1];
        //============
        qDebug()<<"Message Recieved: "<< message << " (non-blocking)";
        //============
        if (message == "") {
            qDebug()<<"CAN interface is not supported";
            for (int i = 0; i < 8; i++){
                data[i]=0;
            }
            //============
            qDebug()<<"Message Not Received: "<< canMessageID << " (non-blocking)";
            //============
            emit message_ready(canMessageID,data);
        }
        else if (message.split(" ")[1] != "[8]"
                || message.split(":")[0].toInt(NULL,16) != canMessageID.toInt(NULL,10) ){ //wrong message
            for (int i = 0; i < 8; i++){
                data[i]=-1;
            }
            // re-acquire message
            can_recieve(canMessageID);
        }
        else {
            for (int i = 0; i < 8; i++){
                data[i]=message.split(" ")[i+2].toInt(NULL,16);
            }
            emit message_ready(canMessageID,data);
        }
    }
    // no such can message on the bus (time out)
    else {
        process->kill();
        for (int i = 0; i < 8; i++){
            data[i]=0;
        }
        //============
        qDebug()<<"Message Not Received: "<< canMessageID << " (non-blocking)";
        //============
        emit message_ready(canMessageID,data);
    }
}
