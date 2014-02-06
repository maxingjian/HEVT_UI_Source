import QtQuick 1.0
//import "backGround"

Rectangle {
    id: mainPage
    width: 800
    height: 480
    color: "#00000000"

    // Bottom bar that is on all screens
    BackGround1 {
        id: background2
        x: 0
        y: 385
        z: 2
        opacity: 1
    }

    // Initialization of home screen
    Home {
        id: home1
        x: 0
        y: 0
    }

    // This page is where the fade, bass and treble is controlled
    VolSetting {
        id: volSettingPage
        x: 0
        y: 0
        z: -1
        opacity: 0
    }

    // This page has all of the radio controls on it
    CRadioPage1 {
        id: cradiopage1
        x: 0
        y: 0
        opacity: 0
    }

    // Page that has all of the air conditioning controls
    Ac1 {
        id: ac2
        x: 0
        y: 0
        opacity: 0
    }

    // Page with battery infomation
    BatteryTemp {
        id: batterytemp1
        x: 0
        y: 0
        opacity: 0
    }

 ////////////////////////////////simulate all the buttons

    //--------------------------------------------------------
    // The home button is accessible no mater what screen the
    // user is on. Whenever it is clicked, it returns the user
    // to "homestate". It is a small button that has covers
    // the home-shaped button on the background bar. The timer
    // is used to send a diagnostic CAN message to the car
    // every second.
    //--------------------------------------------------------
    MouseArea {
        id: homeButton
        x: 325
        y: 395
        width: 150
        height: 85
        anchors.top: parent.top
        anchors.topMargin: 395
        onClicked: {
            mainPage.state ="homestate"
        }

        Timer{
            id: diagnosticMsg
            interval: 1000;
            running: true;
            repeat: true;
            onTriggered: {
                CanControl.send("0x101"," 0x07 0xFE 0x01 0x3E 0x00 0x00 0x00 0x00")
            }
        }
    }

    //--------------------------------------------------------
    // acButton is the button that the user clicks, when on
    // the home screen, to get to the air control page. It
    // covers the entire large blue square on the home page
    // that has a fan on it. The button only goes to the state
    // for temperature control if the user is already on the
    // home screen. Otherwise, it doesn't do anything.
    //--------------------------------------------------------
    MouseArea {
        id: acButton
        x: 522
        y: 129
        width: 210
        height: 210
        onClicked: {
            if(home1.opacity == 1){
                mainPage.state = "newacstate"
            }
        }
    }

    //--------------------------------------------------------
    // The radioButton mouse area creates a button over the
    // radio picture on the homescreen (the purple square with
    // music notes). It only changes states if it is clicked
    // and the user is already in the home state.
    //--------------------------------------------------------
    MouseArea {
        id: radioButton
        x: 300
        y: 129
        width: 210
        height: 210
        onClicked: {
            if(home1.opacity == 1){
                mainPage.state = "radiostate"
            }
        }
    }

    //--------------------------------------------------------
    // The battButton is creates a button on the home page
    // that transitions the user to the BatteryTemp page when
    // it is clicked. If the user is on the home page, then
    // the button brings the machine into the batterystate.
    // Otherwise, the button does nothing. It is positioned
    // over the green square with the battery on the home page.
    //--------------------------------------------------------
    MouseArea {
        id: battButton
        x: 60
        y: 129
        width: 210
        height: 210
        onClicked: {
            if(home1.opacity == 1){
                mainPage.state = "batterystate"
            }
        }
    }

    //--------------------------------------------------------
    // The volSettingButton is currently on the home screen
    // still. Once the page is updated, it will be moved to
    // the radio page, because that's where the new button is.
    //--------------------------------------------------------
    MouseArea{
        id: volSettingButton
        x: 732
        y: 338
        width: 68
        height: 62
        onClicked:{
            if(home1.opacity == 1)
            {
                mainPage.state = "volSettingStage"
            }
        }
    }

/////////////////////////////////////////////////////////////////

    states: [
        State {
            name: "radiostate"

            PropertyChanges {
                target: home1
                opacity: 0
                z: 0
            }
            PropertyChanges {
                target: cradiopage1
                opacity: 1
                z: 1
            }
            PropertyChanges {
                target: ac2
                opacity: 0
                z: 0
            }

            PropertyChanges {
                target: batterytemp1
                opacity: 0
                z: 0
            }
            PropertyChanges {
                target: volSettingPage
                opacity: 0
                z: 0
            }
//            PropertyChanges {
//                target: background1
//                x: 0
//                y: 277
//                opacity: 1
//                onEnergyButtonClicked:{mainPage.state ="energystate"}
//                onRadioButtonClicked:{mainPage.state = "radiostate"}
//                onAcButtonClicked:{mainPage.state = "acstate"}
//                onBatteryButtonClicked:{mainPage.state ="batterystate"}
//            }
        },
        State{
            name: "newacstate"
            PropertyChanges {
                target: home1
                opacity: 0
                z: 0
            }
            PropertyChanges {
                target: cradiopage1
                opacity: 0
                z: 0
            }
            PropertyChanges {
                target: ac2
                opacity: 1
                z: 1
            }
            PropertyChanges {
                target: batterytemp1
                opacity: 0
                z: 0
            }
            PropertyChanges {
                target: volSettingPage
                opacity: 0
                z: 0
            }
//            PropertyChanges {
//                target: background1
//                x: 0
//                y: 277
//                opacity: 1
//                onEnergyButtonClicked:{mainPage.state ="energystate"}
//                onRadioButtonClicked:{mainPage.state = "radiostate"}
//                onAcButtonClicked:{mainPage.state = ""}
//                onBatteryButtonClicked:{mainPage.state ="batterystate"}
//            }
        },
        State {
            name: "batterystate"
            PropertyChanges {
                target: home1
                opacity: 0
                z: 0
            }
            PropertyChanges {
                target: cradiopage1
                opacity: 0
                z: 0
            }
            PropertyChanges {
                target: ac2
                opacity: 0
                z: 0
            }
            PropertyChanges {
                target: batterytemp1
                x: 0
                y: 0
                opacity: 1
                z: 1
            }
            PropertyChanges {
                target: volSettingPage
                opacity: 0
                z: 0
            }

//            PropertyChanges {
//                target: background1
//                x: 0
//                y: 277
//                opacity: 1
//                onEnergyButtonClicked:{mainPage.state ="energystate"}
//                onRadioButtonClicked:{mainPage.state = "radiostate"}
//                onAcButtonClicked:{mainPage.state = "acstate"}
//                onBatteryButtonClicked:{mainPage.state =""}
//            }
        },
        State {
            name: "homestate"
            PropertyChanges {
                target: home1
                opacity: 1
                z: 1
            }
            PropertyChanges {
                target: cradiopage1
                opacity: 0
                z: 0
            }
            PropertyChanges {
                target: ac2
                opacity: 0
                z: 0
            }
            PropertyChanges {
                target: batterytemp1
                opacity: 0
                z: 0
            }
            PropertyChanges {
                target: volSettingPage
                opacity: 0
                z: 0
            }
//            PropertyChanges {
//                target: background1
//                x: 0
//                y: 277
//                opacity: 1
//                onEnergyButtonClicked:{mainPage.state =""}
//                onRadioButtonClicked:{mainPage.state = "radiostate"}
//                onAcButtonClicked:{mainPage.state = "acstate"}
//                onBatteryButtonClicked:{mainPage.state ="batterystate"}
//            }
        },
        State {
            name: "volSettingStage"
            PropertyChanges {
                target: home1
                opacity: 0
                z: 0
            }

            PropertyChanges {
                target: cradiopage1
                opacity: 0
                z: 0
            }
            PropertyChanges {
                target: ac2
                opacity: 0
                z: 0
            }
            PropertyChanges {
                target: batterytemp1
                x: 0
                y: 0
                opacity: 0
                z: 0
            }

            PropertyChanges {
                target: volSettingPage
                x: 0
                y: 0
                opacity: 1
                z: 1
            }
//            PropertyChanges {
//                target: volSettingButton
//                x: 726
//                y: 333
//                width: 74
//                height: 57
//            }
        }
    ]
    Image{
        id: usbActive
        x: 730
        y: 448
        z: 2
        opacity: 0
        source:"UIPictures/Home Screens/usbactive.png"
    }
    MouseArea{
        id: usbButton
        x: 732
        y: 440
        height: 32
        width: 20
        onClicked: {
            CanTest.signalTest();
            if(usbActive.opacity == 1){
                usbActive.opacity = 0
            }
            else{
                usbActive.opacity = 1
            }
        }
    }
    Image{
        id: bluetoothActive
        x: 754
        y: 448
        z: 2
        opacity: 0
        source:"UIPictures/Home Screens/bluetoothactive.png"
    }
    MouseArea{
        id: bluetoothButton
        x: 756
        y: 440
        height: 32
        width: 20
        onClicked: {
            CanTest.signalTest();
            if(bluetoothActive.opacity == 1){
                bluetoothActive.opacity = 0
            }
            else{
                bluetoothActive.opacity = 1
            }
        }
    }

    //Create solid navy rectangle that is behind slider
    Rectangle {
        id: rectangleVolNavy
        x: 48
        y: 463
        width: 206
        height: 2
        z: 3
        color: "navy"
    }

    //Create rectangle that moves with fan slider
    Rectangle {
        id: rectangleVolAqua
        x: 48
        y: 463
        width: sliderVolume.handleX
        height: 2
        z: 3
        color: "aqua"
    }

    Slider {
        id: sliderVolume
        x: 45
        y: 449
        width: 212
        height: 30
        rotation: 0
        z: 3
        maximum: 255
        minimum: 0
        mode: 3
    }

}



