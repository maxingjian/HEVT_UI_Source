#include <QtGui/QApplication>
#include "qmlapplicationviewer.h"
#include <QtCore>
#include <QtDeclarative>
#include <QUrl>

#include "CAN_Setup.h"
#include "AC_Controls.h"
#include "Radio_HeadUnit.h"
#include "CanControl.h"
#include "CanRecieve.h"

/* main.cpp Information
        main.cpp - This file has been modified to accept the signals passed to CAN_Setup.h. The application path is set to the <homefolder>/qml/UI_v2/main.qml
                   in order to resolve problems finding the correct directory during run time on the i.mx53 ard board. The Class from CAN_Setup is called here and
                   is linked to the qml component. setContextProperty is used to link the class from the c++ header file to the qml component file. Lines which
                   are commented are the lines contained in the original unmodified main.cpp file.
*/

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    //QmlApplicationViewer viewer;
    //viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    //viewer.setMainQmlFile(QLatin1String("qml/UI_v2/main.qml"));
    //viewer.showExpanded();
    QString path=QApplication::applicationDirPath()+"/qml/UI_v2/main.qml";
    QDeclarativeView view;
    //view.setSource(QUrl::fromLocalFile(path));
    //view.setSource(QUrl("file:///home/kabi/Desktop/QT_Design/UI_v2-build-desktop/qml/UI_v2/main.qml"));

    CanSetup canSetup;
    view.rootContext()->setContextProperty("CanTest", &canSetup);

    CanControl canControl;
    view.rootContext()->setContextProperty("CanControl",&canControl);

 //   view.rootContext()->setContextProperty("main",&canSetup);

    AcControls acControls;
    view.rootContext()->setContextProperty("AC_Controls", &acControls);

    Radio_Unit radioUnit;
    view.rootContext()->setContextProperty("RadioUnit", &radioUnit);


    view.setSource(QUrl::fromLocalFile(path));
    view.show();

    return app.exec();
}
