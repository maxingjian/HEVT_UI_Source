#ifndef CANRECIEVE_H
#define CANRECIEVE_H

#include <QObject>
#include <QString>
#include <QDebug>
#include <QProcess>
#include <QTimer>
#include <QByteArray>
#include <QList>

class CanRecieve : public QObject
{
    Q_OBJECT
public:
    explicit CanRecieve(QObject *parent = 0);
    
signals:
    // send message_ready signal to CanControl
    void message_ready(QString canMessageID, int* canMessageData);
public slots:
    // can message request from CanControl
    void can_recieve(QString canMessageID);
};

#endif // CANRECIEVE_H
