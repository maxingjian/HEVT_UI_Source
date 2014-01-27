#ifndef CAN_SETUP_H
#define CAN_SETUP_H

#include <QDebug>
#include <QObject>
#include <QProcess>
#include <QTimer>
#include <QByteArray>
#include <QString>
#include <QList>

/*  CAN_Setup.h Information

    CAN_Setup - Contains the signals from the CanTest.qml component. Allows the qml program to communicate with the linux console. qDebug() will print a message
                to the console, however QPreocess with execute can be used to execute console commands. For example, QProcess::execute( "ifconfig can1 up" will
                type in the console { $ifconfig can1 up } which will bring up the information which is a result of executing ifconfig.Q_INVOKABLE makes the function
                visible to the qml program and allows it to be called. Documentation on Q_INVOKABLE can provide more information, as well as
                <http://doc.qt.nokia.com/4.7-snapshot/qtbinding.html#structured-data>

     Interacts with - this file interacts with
                        1) CanTest.qml
                        2) main.cpp
*/

class CanSetup : public QObject
 {
     Q_OBJECT
public:
    Q_INVOKABLE void canMessageValue(const QString &canMessageID, const QString &canInterval, const QString &canMessageData, const QString &startStop) {
        qDebug() << "CAN Message ID" << canMessageID;
        qDebug() << "CAN Interval Value" << canInterval;
        qDebug() << "CAN Message Data" << canMessageData;
        qDebug() << "CAN Start/Stop" << startStop;
        QProcess::execute("cansend can1 -i "+canMessageID+" "+canMessageData);

    }

    Q_INVOKABLE int canRead(const QString &canMessageID, int mode) {
       // qDebug() << "CAN Read";


        QProcess *process = new QProcess();
        process->setProcessChannelMode(QProcess::MergedChannels);
        QStringList arguments;
        QString temp2 = "canecho can1 -v " + canMessageID;
        arguments << "-c" << temp2;
        process->start("/bin/bash",arguments);
        process->waitForFinished(-1);
        QByteArray temp = process->readAll();

        int canData = 0;
        int canArray[8];
        int upperhalfCAN  = 0;
        int lowerhalfCAN = 0;
        int canCounter = 0;

        for( int i=10; i <= 32;i=i+3){

           char data = temp.at(i);
           if ((data >= 'A') && (data <= 'F')){
               canData = data - 'A' + 10;
             }
           else if ((data>='a') && (data<='f')){
               canData = data - 'a' +10;
           }
           else{
              canData = data - '0';
           }
           upperhalfCAN = canData *16;
           printf("upperhalfCAN is: %d\n", upperhalfCAN);

           data = temp.at(i+1);
           if ((data >= 'A') && (data <= 'F')){
               canData = data - 'A' + 10;
             }
           else if ((data>='a') && (data<='f')){
               canData = data - 'a' +10;
           }
           else{
              canData = data - '0';
            }
           lowerhalfCAN = canData;
           printf("lowerhalfCAN is: %d\n", lowerhalfCAN);

           canArray[canCounter] = upperhalfCAN + lowerhalfCAN;
           printf("canArray is: %d\n", canArray[canCounter]);
           canCounter++;
        }
        if (mode == 1){
            return canArray[0];
        }
        if (mode == 2){
            int batteryTempC=0;
            //int batteryTempF=0;

            batteryTempC=canArray[1]*0.5-40;
            //batteryTempF= batteryTempC*(9/5)+32;
            return batteryTempC;
        }
        if (mode==3){
            int batterySOC = 0;
            batterySOC = canArray[2]*0.5;
            return batterySOC;
        }
        if (mode == 4){
            int batteryCurrent = 0;
            batteryCurrent = (canArray[3]*256+canArray[4])*0.025-1000;
            return batteryCurrent;
        }
        return 0;
    }


//    int ModeRead(){
//      QList<int> canArray = canRead("1638");
//      printf("canArray[0] is: %d\n", canArray[0]);
//      return canArray[0];

//    }

    Q_INVOKABLE void consoleTest(void) {
        QString str0 = "ifconfig";
        QString str1 = "ifconfig can1 up";

        QProcess::execute( str0 );
        QProcess::execute( str1 );
        QProcess::execute( str0 );
    }
 /*//////////////////Fangfang testing
 */
    Q_INVOKABLE void signalTest(void){
        emit testChanged("12");
    }
    Q_INVOKABLE void signalTest2(void){
        emit signalChanged("13");
    }
signals:
    void testChanged(QString number);
    void signalChanged(QString number);
    // end Fangfang testing
};

#endif // CAN_SETUP_H
