#include <AC_Controls.h>
#include <QProcess>
//#include <QtGui>

/* CAN_Setup.cpp Information
        CAN_Setup - at the moment this is just a temporary file used to hold the commands listed, it is not used in the program as of right now (8/1/2011)
*/



AcControls::AcControls()
{

//    iTimer = new QTimer(this);
//    QObject::connect(iTimer, SIGNAL(timeout()), this, SLOT(TimeOut()));
}

void AC_Controls(void)
{
   QString str = "ifconfig can1 up";
   QProcess::execute( str );
   QString str1 = "ifconfig -v";
   QProcess::execute( str1 );
}

/*              Save for later.
void AcControls::TimeOut(void)
{
    QString str2 = "cansend can1 -i 0x244 0x07 0xAE 0X01 0X10 0X10 0X0 0X0 0X0";
    QProcess::execute(str2);
    qDebug() << "cansend can1 -i 244 0x07 0xAE 0X01 0X10 0X10 0X0 0X0 0X0";
}

*/
