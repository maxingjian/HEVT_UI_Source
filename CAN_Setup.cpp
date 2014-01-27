#include <CAN_Setup.h>
#include <QProcess>

/* CAN_Setup.cpp Information
        CAN_Setup - at the moment this is just a temporary file used to hold the commands listed, it is not used in the program as of right now (8/1/2011)
*/

void CAN_Setup(void)
{
   QString str = "ifconfig can1 up";
   QProcess::execute( str );
   QString str1 = "ifconfig -v";
   QProcess::execute( str1 );
}

