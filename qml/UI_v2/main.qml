import QtQuick 1.0
//import "backGround"

Rectangle {
    id: mainPage
    width: 800
    height: 480
    color: "#00000000"

    BackGround1 {
        id: background2
        x: 0
        y: 385
        z: 2
        opacity: 1
    }

    Home {
        id: home1
        x: 0
        y: 0
    }

    VolSetting {
        id: volSettingPage
        x: 0
        y: 0
        z: -1
        opacity: 0
    }

    CRadioPage1 {
        id: cradiopage1
        x: 0
        y: 0
        opacity: 0
    }

    Ac {
        id: ac1
        x: 0
        y: 0
        opacity: 0
    }

    Ac1 {
        id: ac2
        x: 0
        y: 0
        opacity: 0
    }

    BatteryTemp {
        id: batterytemp1
        x: 0
        y: 0
        opacity: 0
    }

 ////////////////////////////////simulate all the buttons

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
    }

    MouseArea {
        id: acButton
        x: 170
        y: 50
        width: 110
        height: 76
        onClicked: {
            if(home1.opacity ==1){
                mainPage.state = "acstate"
            }
        }
    }

    MouseArea {
        id: acNewButton
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
                target: ac1
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
//                onEnergyButtonClicked:{mainPage.state ="energystate"}
//                onRadioButtonClicked:{mainPage.state = "radiostate"}
//                onAcButtonClicked:{mainPage.state = "acstate"}
//                onBatteryButtonClicked:{mainPage.state ="batterystate"}
//            }
        },
        State {
            name: "acstate"
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
                target: ac1
                x: -1
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
//                onAcButtonClicked:{mainPage.state = ""}
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
                target: ac1
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
                target: ac1
                x: 0
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
                target: ac1
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
                target: ac1
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



