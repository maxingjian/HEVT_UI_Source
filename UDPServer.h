#ifndef UDPSERVER_H
#define UDPSERVER_H
#include <QDebug>
#include <QUdpSocket>
#include <QObject>
#include <QNetworkInterface>
#include <qmath.h>

#include <QObject>

class UDPServer : public QObject
{
    Q_OBJECT
public:
    explicit UDPServer(QObject *parent = 0);
    void processTheDatagram(QHostAddress sender, quint16 port, QByteArray datagram);


private:
    QUdpSocket *socketRx;
    QUdpSocket *socketTx;

    
signals:
    void dataReady(char datagram);
public slots:
    void readPendingDatagrams();
    void initSocket(int port);
    void unbind();
    void sendUDP(qint32 ip, quint16 port, QByteArray datagram);
};

#endif // SERVER_H
