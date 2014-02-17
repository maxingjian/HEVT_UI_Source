#ifndef AC_CONTROLS_H
#define AC_CONTROLS_H

#include <qdebug.h>
#include <QObject>
#include <QProcess>
#include <QTimer>
#include <string>


/*  AC_Controls.h Information

    AC_Controls - Contains the signals from the POC_Layout.qml and FanLevel.qml components. Allows the qml program to communicate with the linux console
                  and is very similair to CAN_Setup.h


    Interacts with - this file interacts with
                        1) CanTest.qml
                        2) main.cpp
                        3) FanLevel.qml
                        4) POC_Layout.qml
*/

class AcControls : public QObject
 {
     Q_OBJECT
public:

    QTimer* iTimer;
    AcControls();

    Q_INVOKABLE void acButton(bool acButtonStatus) {
          qDebug() << "AC Status (true = on)" << acButtonStatus;
          QString str0 = "cansend can1 -i 0x251 0x07 0xAE 0X04 0X01 0X01 0X0 0X0 0X0";
          QProcess::execute(str0);
    }

    Q_INVOKABLE void circulate(bool circulateStatus) {
          qDebug() << "Air Circulation Status (true = circulate)" << circulateStatus;
          QString str0 = "cansend can1 -i 0x251 0x07 0xAE 0X04 0X04 0X04 0X0 0X0 0X0";
          QProcess::execute(str0);
    }

    Q_INVOKABLE void defrostR(bool DefrostStatusR) {
          qDebug() << "Rear Defrost Status (true = Active)" << DefrostStatusR;
          QString str0 = "cansend can1 -i 0x251 0x07 0xAE 0X04 0X10 0X10 0X0 0X0 0X0";
          QProcess::execute(str0);

    }

    Q_INVOKABLE void autoChange(void){
        qDebug() << "Auto toggled";
        QString str0 = "cansend can1 -i 0x251 0x07 0xAE 0X04 0X08 0X08 0X0 0X0 0X0";
        QProcess::execute(str0);
    }

    Q_INVOKABLE void DefrostF(bool DefrostStatusF) {
          qDebug() << "Front Defrost Status (true = Active)" << DefrostStatusF;
          QString str0 = "cansend can1 -i 0x251 0x07 0xAE 0X04 0X0 0X0 0X01 0X01 0X0";
          QProcess::execute(str0);

    }

    // This function is not used/sends no can messages**
    //********************Delete in future
    Q_INVOKABLE void ventButtons(const QString &ventButtonStatus) {
          qDebug() << "Vent Status:" << ventButtonStatus;
    }
    //**************************************************

    Q_INVOKABLE void fanLevel(QString fanSpeed){
        QString str0;
        qDebug() << "Current Fan Level:" + fanSpeed;       // Min: 0, off position. Max: 100, full On position
        str0 = "cansend can1 -i 0x251 0x07 0xAE 0x02 0x08 0x00 0x00 0x00 0x"+ fanSpeed;
        QProcess::execute(str0);
    }

    Q_INVOKABLE void acTemp(QString acTempLeft, QString acTempRight){
        qDebug() << "Current AC Temp Left is set at: "+acTempLeft;       // Min: 60, Max: 80
        qDebug() << "Current AC Temp Right is set at: "+acTempRight;       // Min: 60, Max: 80
        QString str1 = "cansend can1 -i 0x251 0x07 0xAE 0x02 0x02 0x"+acTempRight+" 0x0 0x0 0x0";
        QString str0 = "cansend can1 -i 0x251 0x07 0xAE 0x02 0x01 0x"+acTempLeft +" 0x0 0x0 0x0";
        QProcess::execute(str1);
        QProcess::execute(str0);
    }

    Q_INVOKABLE QString convert(int valueToConvert) {
        QString hexValue = QString::number(valueToConvert, 16);
        return hexValue;
    }

    Q_INVOKABLE void acFloorToggle(){
        qDebug() << "Floor fan toggles";
        QString str1 = "cansend can1 -i 0x251 0x07 0xAE 0X04 0X80 0X80 0X0 0X0 0X0";
        QProcess::execute(str1);
    }

    Q_INVOKABLE void acFaceToggle(){
        qDebug() << "Face fan toggles";
        QString str1 = "cansend can1 -i 0x251 0x07 0xAE 0X04 0X40 0X40 0X0 0X0 0X0";
        QProcess::execute(str1);
    }

    /*  non-QML resident timer. Save for later usage.

    Q_INVOKABLE void mPower(bool mPowerStatus) {
          qDebug() << "Media Power (true = on)" << mPowerStatus;
          if (mPowerStatus == true) {
              iTimer->start(3000);
              qDebug() << "Timer Started";

          }
          else
          {
                  iTimer->stop();
                  qDebug() << "Timer Stopped";
          }
    }
    */


public slots:

//void TimeOut(void);

};

#endif // AC_CONTROLS_H
