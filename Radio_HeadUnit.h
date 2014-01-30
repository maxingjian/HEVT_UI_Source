#ifndef RADIO_HEADUNIT_H
#define RADIO_HEADUNIT_H

#include <qdebug.h>
#include <QObject>
#include <QProcess>
#include <QTimer>


class Radio_Unit : public QObject

{
    Q_OBJECT

public:

    Radio_Unit();

    Q_INVOKABLE void radioBus(const QString &busMessage, const QString selection) {  // CAN message BUS for all non-timer-related radio signals
        QProcess::execute("cansend can1 -i "+busMessage);
        qDebug() << selection+" Selected";
        qDebug() << busMessage;
    }

    Q_INVOKABLE void radioPwr(const QString radioMsg, const QString radioStatus) {  // Send radio on / off message
          QProcess::execute("cansend can1 -i "+radioMsg);
          qDebug() << "Radio is currently "+radioStatus;
          qDebug() <<  radioMsg;
    }

    Q_INVOKABLE void testing(const QString bugs) {
        qDebug() << bugs+" is currently buggy";
    }

};

#endif // RADIO_HEADUNIT_H
