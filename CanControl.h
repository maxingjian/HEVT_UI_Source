#ifndef CANCONTROL_H
#define CANCONTROL_H

#include <QObject>
#include <QDebug>
#include <QProcess>
#include <QTimer>
#include <QByteArray>
#include <QString>
#include <QList>
#include <QThread>
#include <QDebug>
#include "CanRecieve.h"
#include "UDPServer.h"


class CanControl : public QObject
{
    Q_OBJECT
public:
    Q_INVOKABLE explicit CanControl(QObject *parent = 0);
    Q_INVOKABLE void start_up();
    // send can message.  canMessageID is in decimal
    Q_INVOKABLE void send(QString canMessageID, QString canMessageData){
        QString msg = "cansend can1 -i "+canMessageID+" "+canMessageData;
        QProcess::execute(msg);
//        qDebug() << "Sending diagnostic message" << msg;
    }

    Q_INVOKABLE void sendHighSpeed(QString canMessageID, QString canMessageData){
        QString msg1 = "cansend can0 -i "+canMessageID+" 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x0"+canMessageData;
        QProcess::execute(msg1);
        qDebug() << "Sending message " << msg1;
    }

    // blocking recieve. canMessageID is in decimal
    Q_INVOKABLE int* recieve_b(QString canMessageID);
    // non-blocking recieve. Start recieving in a new thread and return immidiately.
    Q_INVOKABLE void recieve_nb(QString canMessageID);
    //fangfang testing
    Q_INVOKABLE void testing(){
        emit veh_mode_recieved("1");
    }

    Q_INVOKABLE void wifi_connect();

    //end testing

signals:
    // correspond to recieve_nb. canMessageData is a pointer points to the first element of an int[8]
//    void message_recieved(QString canMessageID, int *canMessageData);

    void veh_mode_recieved(QString veh_mode);
    void batt_temp_recieved(int bett_temp);
    void batt_soc_recieved(int batt_soc);
    void batt_current_recieved(int batt_current);
    void batt_avg(QString batt_avg);
    void batt_low(QString batt_low);
    void batt_high(QString batt_high);

//    int find_low();
//    int find_high();
//    int find_avg();

    // private signal used to communicate with _canRecieve
    void _can_recieve_start(QString canMessageID);

private:
    CanRecieve* _canRecieve;
    QThread* _recieveThread;
    QUdpSocket* txSocket;

private slots:
    // private slot to recieve message ready signal from CanRecieve.
    void _message_ready(QString canMessageID, int *canMessageData);
};

#endif // CANCONTROL_H
