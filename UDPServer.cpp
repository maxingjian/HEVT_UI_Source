#include "UDPServer.h"

UDPServer::UDPServer(QObject *parent) :
    QObject(parent)
{
    socketRx = new QUdpSocket(this);
    socketTx = new QUdpSocket(this);
}

void UDPServer::initSocket(int port)
{
    socketRx->bind(QHostAddress::Any, quint16(port));
    connect(socketRx, SIGNAL(readyRead()),
            this, SLOT(readPendingDatagrams()));
    qDebug()<<( QString("Port set to: ") + QString::number(port) + QString("\n") );
}

void UDPServer::unbind(){
    socketRx->close();
}

void UDPServer::readPendingDatagrams()
{
    while (socketRx->hasPendingDatagrams()) {
        QByteArray datagram;
        datagram.resize(socketRx->pendingDatagramSize());
        QHostAddress sender;
        quint16 senderPort;
        socketRx->readDatagram(datagram.data(), datagram.size(),
                                &sender, &senderPort);
        processTheDatagram(sender,senderPort,datagram);
    }
}

void UDPServer::processTheDatagram(QHostAddress sender, quint16 port, QByteArray datagram){
    QString buf = QString( sender.toString() + QString(":") + QString::number(port) +
                             " [" + QString::number(datagram.size()) + "] ");
//    while (datagram.size() != 0 ){
//        buf += QString::number(datagram.at(0),16).right(2).rightJustified(2,'0',true).toUpper() + QString(" ");
//        datagram.remove(0,1);
//    }
    emit dataReady(datagram.at(0));
}

void UDPServer::sendUDP(qint32 ip, quint16 port, QByteArray datagram){
    socketTx->writeDatagram(datagram, datagram.size(), QHostAddress(ip), port);
}
