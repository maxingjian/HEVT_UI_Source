import QtQuick 1.0
import QtQuick 1.1

Image{
    property string acText: "place"
    property string driverTemp: "4"
    property string passengerTemp: "4"
    id: acPage
    x: 0
    y: 0
    width: 800
    height: 480
    z: -1
    opacity: 1
    source: "UIPictures/Home Screens/air control.png"
    Image{
        id: acCirculate
        x: 351
        y: 91
        opacity: 0
        source:"UIPictures/Buttons/Air Buttons/circulateactive.png"
    }
    MouseArea{
        id: acCirculateButton
        x: 318
        y: 70
        width: 148
        height: 76
        onClicked:{
            if(acCirculate.opacity == 1){
                acCirculate.opacity = 0
                AC_Controls.circulate(false)
            }
            else{
                acCirculate.opacity = 1
                AC_Controls.circulate(true)
            }
        }
    }
    MouseArea{
        id: turnOffAuto
        x: 318
        y: 0
        width: 148
        height: 20
        onClicked: AC_Controls.autoChange()
    }

    Image{
        id: rearDefrost
        x: 253
        y: 72
        opacity: 0
        source: "UIPictures/Buttons/Air Buttons/defrostactive.png"
    }
    MouseArea{
        id: rearDefrostButton
        x: 318
        y: 147
        width: 148
        height: 76
        onClicked:{
            if (rearDefrost.opacity == 1){
                rearDefrost.opacity = 0
                AC_Controls.defrostR(false)
            }
            else {
                rearDefrost.opacity = 1
                AC_Controls.defrostR(true)
            }
        }
    }

    Image{
        id: acOn
        x: 253
        y: 122
        opacity: 0
        source: "UIPictures/Buttons/Air Buttons/acactive.png"
    }
    MouseArea{
        id:acOnButton
        x: 330
        y: 224
        width: 143
        height: 76
        onClicked:{
            if(acOn.opacity == 1){
                acOn.opacity = 0
                AC_Controls.acButton(false) //Toggles AC State with Button Effect and starts/stops CAN timer
            }
            else{
                acOn.opacity = 1
                AC_Controls.acButton(true) //Toggles AC State with Button Effect and starts/stops CAN timer
            }
        }
    }

    Image{
        id: frontDefrost
        x: 247
        y: 192
        opacity: 0
        source: "UIPictures/Buttons/Air Buttons/frontdefrostactive.png"
    }
    MouseArea{
        id: frontDefrostButton
        x: 330
        y: 301
        width: 143
        height: 76
        onClicked: {                            // Turns on and off when
            if(frontDefrost.opacity == 1) {     // clicked
                frontDefrost.opacity = 0
                AC_Controls.DefrostF(false)
            }
            else {
                frontDefrost.opacity = 1
                AC_Controls.DefrostF(true)
            }
        }
    }

    Image{
        id: acDown
        x: 23
        y: 234
        opacity: 0
        source:"UIPictures/Buttons/Air Buttons/driverfeetarrowactive.png"
    }
    MouseArea{
        id: acDownButton
        x: 30
        y: 215
        height: 71
        width: 62
        onClicked: {
            CanTest.signalTest();
            if(acDown.opacity == 1){
                acDown.opacity = 0
                acDownPassenger.opacity = 0
                AC_Controls.acFloorToggle()
            }
            else{
                acDown.opacity = 1
                acDownPassenger.opacity = 1
                AC_Controls.acFloorToggle()
            }
        }
    }

    Image{
        id: acFace
        x: 38
        y: 138
        opacity: 0
        source:"UIPictures/Buttons/Air Buttons/driverfacearrowactive.png"
    }
    MouseArea{
        id: acFaceButton
        x: 38
        y: 135
        height: 71
        width: 78
        onClicked: {
            CanTest.signalTest();
            if(acFace.opacity == 1){
                acFace.opacity = 0
                acFacePassenger.opacity = 0
                AC_Controls.acFaceToggle()
            }
            else{
                acFace.opacity = 1
                acFacePassenger.opacity = 1
                AC_Controls.acFaceToggle()
            }
        }
    }

    Image{
        id: acDownPassenger
        x: 489
        y: 210
        opacity: 0
        source:"UIPictures/Buttons/Air Buttons/driverfeetarrowactive.png"
    }
    MouseArea{
        id: acDownButtonPassenger
        x: 489
        y: 200
        height: 71
        width: 62
        onClicked: {
            CanTest.signalTest();
            if(acDownPassenger.opacity == 1){
                acDownPassenger.opacity = 0
                acDown.opacity = 0
                AC_Controls.acFloorToggle()
            }
            else{
                acDownPassenger.opacity = 1
                acDown.opacity = 1
                AC_Controls.acFloorToggle()
            }
        }
    }

    Image{
        id: acFacePassenger
        x: 502
        y: 120
        opacity: 0
        source:"UIPictures/Buttons/Air Buttons/driverfacearrowactive.png"
    }
    MouseArea{
        id: acFaceButtonPassenger
        x: 502
        y: 117
        height: 71
        width: 82
        onClicked: {
            CanTest.signalTest();
            if(acFacePassenger.opacity == 1){
                acFacePassenger.opacity = 0
                acFace.opacity = 0
                AC_Controls.acFaceToggle()
            }
            else{
                acFacePassenger.opacity = 1
                acFace.opacity = 1
                AC_Controls.acFaceToggle()
            }
        }
    }

    //Create solid navy rectangle that is behind slider
    Rectangle {
        id: fanSpeedNavy
        x: 135
        y: 88
        width: 160
        height: 2
        z: 0
        color: "navy"
    }

    //Create rectangle that moves with fan slider
    Rectangle {
        id: fanSpeedAqua
        x: 135
        y: 88
        width: sliderFan.handleX
        height: 2
        z: 0
        color: "aqua"
    }

    Slider {
        id: sliderFan
        x: 132
        y: 74
        width: 164
        height: 30
        rotation: 0
        z: 1
        maximum: 100
        minimum: 0
        mode: 1
    }

    Slider {
        id: sliderTemp
        x: 95
        y: 240
        width: 224
        height: 40
        z: 1
        maximum: 100
        minimum: 0
        mode: 2
    }

    Slider {
        id: sliderTempPassenger
        x: 558
        y: 209
        width: 224
        height: 35
        z: 1
        maximum: 100
        minimum: 0
        mode: 4
    }
}
