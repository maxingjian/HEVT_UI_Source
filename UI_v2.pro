# Add more folders to ship with the application, here
folder_01.source = qml/UI_v2
folder_01.target = qml

//folder_02.source = DatabaseFiles/PhoneContacts //Implement a phone book example if enough time
//folder_02.target = DatabaseFiles

DEPLOYMENTFOLDERS += folder_01
//DEPLOYMENTFOLDERS += folder_02

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

symbian:TARGET.UID3 = 0xE559B5AA

# Smart Installer package's UID
# This UID is from the protected range and therefore the package will
# fail to install if self-signed. By default qmake uses the unprotected
# range value if unprotected UID is defined for the application and
# 0x2002CCCF value if protected UID is given to the application
#symbian:DEPLOYMENT.installer_header = 0x2002CCCF

# Allow network access on Symbian
symbian:TARGET.CAPABILITY += NetworkServices

# If your application uses the Qt Mobility libraries, uncomment the following
# lines and add the respective components to the MOBILITY variable.
# CONFIG += mobility
# MOBILITY +=

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    CAN_Setup.cpp \
    AC_Controls.cpp \
    Radio_HeadUnit.cpp \
    CanRecieve.cpp \
    CanControl.cpp

# Please do not modify the following two lines. Required for deployment.
include(qmlapplicationviewer/qmlapplicationviewer.pri)
qtcAddDeployment()

RESOURCES += \
    UI_Pictures.qrc

HEADERS += \
    CAN_Setup.h \
    AC_Controls.h \
    Radio_HeadUnit.h \
    CanRecieve.h \
    CanControl.h

OTHER_FILES += \
    qml/UI_v2/BackGround.qml \
    qml/UI_v2/BatteryTemp.qml \
    qml/UI_v2/Ac.qml \
    qml/UI_v2/VolSetting.qml \
    qml/UI_v2/Ac1.qml \
    qml/UI_v2/Home.qml















