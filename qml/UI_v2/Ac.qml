import QtQuick 1.0
import QtQuick 1.1

Image{
    id: acPage
    x: 0
    y: 0
    width: 800
    height: 400
    z: -1
    opacity: 1
    source: "UIPictures/acPage_new2.png"
    Image{
        id: acCirculate
        x: 331
        y: 50
        opacity: 0
        source:"UIPictures/acCirculate.png"
    }
    MouseArea{
        id: acCirculateButton
        x: 318
        y: 44
        width: 148
        height: 76
        onClicked:{
            if(acCirculate.opacity == 1){
                acCirculate.opacity = 0
            }
            else{
                acCirculate.opacity = 1
            }
        }
    }
    Image{
        id: acDown
        x: 222
        y: 141.5
        opacity: 0
        source:"UIPictures/acDown.png"
    }
    MouseArea{
        id: acDownButton
        x: 222
        y: 142
        height: 71
        width: 62
        onClicked: {
            CanTest.signalTest();
            if(acDown.opacity == 1){
                acDown.opacity = 0
            }
            else{
                acDown.opacity = 1
            }
        }
    }

    Image{
        id: acIcon
        x: 365.5
        y: 209.5
        opacity: 0
        source:"UIPictures/acIcon.png"
    }
    MouseArea{
        id: acIconButton
        x: 323
        y: 199
        height: 64
        width: 138
        onClicked: {
            if(acIcon.opacity == 1){
                AC_Controls.acButton(false);
                acIcon.opacity = 0
            }
            else{
                AC_Controls.acButton(true);
                acIcon.opacity = 1
            }
        }
    }
    Image{
        id: acLeft
        x: 153
        y: 86
        opacity: 0
        source:"UIPictures/acLeft.png"
    }
    MouseArea{
        id: acLeftButton
        x: 145
        y: 92
        height: 55
        width: 68
        onClicked: {
            if(acLeft.opacity == 1){
                acLeft.opacity = 0
            }
            else{
                acLeft.opacity = 1
            }
        }
    }
    Image{
        id: acUp
        x: 339
        y: 113
        opacity: 0
        source:"UIPictures/acUp.png"
    }
    MouseArea{
        id: acUpButton
        x: 318
        y: 120
        height: 79
        width: 148
        onClicked:{
            if(acUp.opacity == 1){
                acUp.opacity = 0
            }
            else{
                acUp.opacity = 1
            }
        }
    }
    Image{
        id: acWindow
        x: 210
        y: 84
        opacity: 0
        source:"UIPictures/acWindow.png"
    }
    MouseArea{
        id: acwindowButton
        x: 213
        y: 90
        width: 76
        height: 52
        opacity: 1
        onClicked:{
            if(acWindow.opacity == 1){
                acWindow.opacity = 0
            }
            else{
                acWindow.opacity = 1
            }
        }
    }

///////////////////////////////////////////////
// passenger temperature starts here
//Image{
//    id: passengerTemp5
//    x: 563
//    y: 58
//    opacity: 1
//    source:"UIPictures/pass5.png"
//}
/////////////////////////////////////////////


////////////////////////////////////////////
//driver temperature starts here

//Image{
//    id: driverTemp1
//    x: 494
//    y: 45
//    opacity:1
//    source:"UIPictures/ac5.png"
//}
///////////////////////////////////////////
//    Image{
//        id: acTemps1
//        x: 490.5
//        y: 19
//        opacity: 1
//        source: "UIPictures/actemp1.png"
//    }
//    MouseArea{
//        id: acTemps1Button
//        x: 504
//        y: 84
//        height: 226
//        width: 257
//        onClicked:{
//            if(acTemps1.opacity == 1){
//                acTemps1.opacity = 0
//            }
//            else{
//                acTemps1.opacity = 1
//            }
//        }
//    }
/////////////////////////////////////////////////////////////////////////////////////////////////////
//this section is the variables
    //Variables Used in POC_Layout
        // Right and left Temperature Text Display Variables
            property int leftTempText
            property int rightTempText
        // Right and left Temperature values
            property int leftTempValue
            property int rightTempValue
        // Temperature Timer State
            property string timerState      // see Timer (id: tempTimer) for more info
        // Rear Defrost Timer State
            property string rearDefTimerState
        // Front Defrost Timer State
            property string frontDefTimerState
        //fancounter to determine fan speed
            property int fancounter: 0

    //Initialize Variables
        // Initialize Temperature Value Variables to 70 Degrees F
            leftTempValue: { leftTempValue = 70 }
            rightTempValue: { rightTempValue = 70 }

    //OnChanged settings
        // On Temperature Change, Adjust Temperature Text and Pointer Location. 1 Degree F = 9 Degree rotation
            //onLeftTempValueChanged: { leftTempText = leftTempValue; pointerLeft.rotation = ( leftTempValue - 60 ) * -9 }
            //onRightTempValueChanged: { rightTempText = rightTempValue; pointerRight.rotation = ( rightTempValue - 60 ) * 9 }
//////////////////////////////////////////////////////////////////////////implementation
            MouseArea {                 // Fan decrease button mouse area. Controls press/click events and effects
                id: fanDecrease;
                x: 508
                y: 91
                width: 50
                height: 48

                onClicked: {
                    fancounter = fancounter - 1
                    if(fancounter == 0){
                        fanspeed1.visible = false
                        fanspeed2.visible = false
                        fanspeed3.visible = false
                        fanspeed4.visible = false
                        AC_Controls.fanspeed0()
                    }

                    if (fancounter == 1){
                        fanspeed1.visible = true
                        fanspeed2.visible = false
                        fanspeed3.visible = false
                        fanspeed4.visible = false
                        AC_Controls.fanspeed25()
                    }
                    if(fancounter == 2){
                        fanspeed1.visible = true
                        fanspeed2.visible = true
                        fanspeed3.visible = false
                        fanspeed4.visible = false
                        AC_Controls.fanspeed50()
                    }
                    if(fancounter == 3){
                        fanspeed1.visible = true
                        fanspeed2.visible = true
                        fanspeed3.visible = true
                        fanspeed4.visible = false
                        AC_Controls.fanspeed75()
                    }
                    if(fancounter == 4){
                        fanspeed1.visible = true
                        fanspeed2.visible = true
                        fanspeed3.visible = true
                        fanspeed4.visible = true
                        AC_Controls.fanspeed100()
                    }
                    if(fancounter < 0){
                        fancounter = 0
                        AC_Controls.fanspeed0()
                    }
                    console.log("fancounter is ", fancounter);
                }
                    //fanLevel.fanLevelDecrease()              //on a mouse click, decrease fan level by one
//                onPressed: {

//                    fanDecreaseEffect.visible = true         //on a press, show button pressed effect
//                    AC_Controls.fanDownStart()

//                }
//                onReleased: {

//                    fanDecreaseEffect.visible = false       //on release, hide button pressed effect
//                    AC_Controls.fanDownStop()
//                }

//                Image {                     //Image for the button pressed effect (Inner Glow)
//                    id: fanDecreaseEffect;
//                    x: 0
//                    y: 0
//                    anchors.rightMargin: 0
//                    anchors.bottomMargin: 0
//                    anchors.leftMargin: 0
//                    anchors.topMargin: 0
//                    anchors.fill: parent;
//                    visible: false;
//                    source: "UIPictures/ProofOfConcept/AC_ButtonEffect.png" }
            }

            MouseArea {                 // Fan increase button mouse area. Controlls press/click events and effects
                id: fanIncrease; x: 700; y: 91; width: 55; height: 48

                onClicked: {
                    fancounter = fancounter + 1

                    if (fancounter == 1){
                        fanspeed1.visible = true
                        AC_Controls.fanspeed25()
                    }
                    if(fancounter == 2){
                        fanspeed2.visible = true
                        AC_Controls.fanspeed50()
                    }
                    if(fancounter == 3){
                        fanspeed3.visible = true
                        AC_Controls.fanspeed75()
                    }
                    if(fancounter == 4){
                        fanspeed4.visible = true
                        AC_Controls.fanspeed100()
                    }
                    if(fancounter >= 4){
                        fancounter = 4
                        AC_Controls.fanspeed100()
                    }
                    console.log("fancounter is ", fancounter);
                }

                    //fanLevel.fanLevelIncrease()              //on a mouse click, increase fan level by one
//                onPressed: {

//                    //fanIncreaseEffect.visible = true         //on a press, show button pressed effect
//                    AC_Controls.fanUpStart()

//                }
//                onReleased: {

//                    //fanIncreaseEffect.visible = false       //on release, hide button pressed effect
//                    AC_Controls.fanUpStop()
//                }

//                Image {                     //Image for the button pressed effect (Inner Glow)
//                    id: fanIncreaseEffect;
//                    anchors.fill: parent;
//                    visible: false;
//                    source: "UIPictures/ProofOfConcept/AC_ButtonEffect.png" }
            }

            Timer {                     // Timer for evaluating automatic temp decrease on press and hold.
                /*
                                          When a cold or hot Temp button is press and held this lowers the temperature by 1 degree each step. Each step while still held
                                          is faster to a maximum of around 200ms (starts at 500ms, decreases 60ms per step). timerState variable allows the determination
                                          of which button is pressed, left hot/cold or right hot/cold
                                        */
                id: tempTimer;
                interval: 500;
                running: false;
                repeat: true;
                onTriggered:{

                    switch (timerState) {

                    case "leftCold":
                        if ( leftTempValue > 60 ) {                     //If the left Temp Controlls Cold button is held, decrease until min value of 60
                            leftTempValue -= 1;                         //Decrease Temperature Text by 1 degree (each step lowers by 1 degree)
                            if (tempTimer.interval > 200) {             //Controls the speed of decrease, start slow and get faster until a max period of 200ms
                                tempTimer.interval -= 60
                            }
                        } return


                    case "rightCold":                                   //If the Right Temp Controlls Cold button is held, decrease until min value of 60
                        if ( rightTempValue > 60 ) {
                            rightTempValue -= 1;                        //Decrease Temperature Text by 1 degree (each step lowers by 1 degree)
                            if (tempTimer.interval > 200) {             //Controls the speed of decrease, start slow and get faster until a max period of 200ms
                                tempTimer.interval -= 60
                            }
                        } return


                    case "leftHot":
                        if ( leftTempValue < 80 ) {                     //If the Left Temp Controlls Hot button is held, decrease until min value of 60
                            leftTempValue += 1;                         //Increase Temperature Text by 1 degree (each step raises by 1 degree)
                            if (tempTimer.interval > 200) {             //Controls the speed of decrease, start slow and get faster until a max period of 200ms
                                tempTimer.interval -= 60
                            }
                        } return

                    case "rightHot":
                        if ( rightTempValue < 80 ) {                    //If the Right Temp Controlls Hot button is held, decrease until min value of 60
                            rightTempValue += 1;                        //Increase Temperature Text by 1 degree (each step raises by 1 degree)
                            if (tempTimer.interval > 200) {             //Controls the speed of decrease, start slow and get faster until a max period of 200ms
                                tempTimer.interval -= 60
                            }
                        } return

                    default: break

                    }


                }

            }

            MouseArea {             // AC Button Mouse Area and Effect
                id: acButton
                x: 348
                y: 207
                width: 100
                height: 47
                opacity: 1
                visible: true

                Image {             // AC Button Effect Image
                    id: acButtonEffect
                    x: 20
                    y: 0
                    width: 68
                    height: 42
                    anchors.rightMargin: 12
                    anchors.bottomMargin: 5
                    anchors.leftMargin: 20
                    anchors.topMargin: 0
                    anchors.fill: parent
                    source: "UIPictures/acIcon.png"
                    visible: false
                }

                onPressed: {        //When Pressed, Toggle AC On or Off
                    acButtonEffect.visible = !acButtonEffect.visible            //Toggles AC Button Effect
                    AC_Controls.acButton(acButtonEffect.visible)                //Toggles AC State with Button Effect and starts/stops CAN timer
                }
            }

            MouseArea {             // Vent Button Top Mouse Area and Effect
                id: ventButtonTop
                x: 140
                y: 84
                width: 82
                height: 61

                Image {             // Vent Button Effect Image
                    id: ventButtonTopEffect
                    x: 17
                    y: 0
                    width: 60
                    height: 66
                    anchors.rightMargin: 5
                    anchors.bottomMargin: -5
                    anchors.topMargin: 0
                    anchors.leftMargin: 17
                    anchors.fill: parent
                    source: "UIPictures/acLeft.png"
                    visible: false
                }

                onPressed: {        // When Pressed make only the Top Vent button active
                    ventButtonTopEffect.visible = !ventButtonTopEffect.visible;
                    ventButtonTopBottomEffect.visible = ventButtonBottomEffect.visible = false
                    AC_Controls.ventButtons("top")
                }
            }

            MouseArea {             // Vent Button Top/Bottom split Mouse Area and Effect
                id: ventButtonTopBottom
                x: 212
                y: 142
                width: 85
                height: 75

                Image {             // Vent Button Top/Bottom split Effect Image
                    id: ventButtonTopBottomEffect
                    anchors.fill: parent
                    source: "UIPictures/acDown.png"
                    visible: false
                }

                onPressed: {        // When Pressed make only the Top Bottom Mix Vent button active
                    ventButtonTopBottomEffect.visible = !ventButtonTopBottomEffect.visible
                    ventButtonTopEffect.visible = ventButtonBottomEffect.visible = false
                    AC_Controls.ventButtons("topbottom")
                }
            }

            MouseArea {             // Vent Button Bottom Mouse Area and Effect
                id: ventButtonBottom
                x: 213
                y: 142
                width: 76
                height: 64

                Image {             // Vent Button Bottom Effect
                    id: ventButtonBottomEffect
                    x: 13
                    y: 0
                    width: 63
                    height: 70
                    anchors.rightMargin: 0
                    anchors.bottomMargin: -6
                    anchors.leftMargin: 13
                    anchors.topMargin: 0
                    anchors.fill: parent
                    source: "UIPictures/acDown.png"
                    visible: false
                }

                onPressed: {        // When Pressed make only the Bottom Vent button active
                    ventButtonBottomEffect.visible = !ventButtonBottomEffect.visible
                    ventButtonTopEffect.visible = ventButtonTopBottomEffect.visible = false
                    AC_Controls.ventButtons("bottom")
                }
            }

            MouseArea {             // Circulate Air Button Mouse Area and Effect
                id: circulateAirButton
                x: 323
                y: 39
                width: 149
                height: 75

                Image {             // Circulate Air Button Effect
                    id: circulateAirButtonEffect
                    x: 11
                    y: 10
                    width: 121
                    height: 65
                    anchors.rightMargin: 17
                    anchors.bottomMargin: 0
                    anchors.leftMargin: 11
                    anchors.topMargin: 10
                    anchors.fill: parent
                    source: "UIPictures/acCirculate.png"
                    visible: false
                }

                onPressed: {        // When Pressed make the circulate air button active
                    circulateAirButtonEffect.visible = !circulateAirButtonEffect.visible
                    AC_Controls.circulate(circulateAirButtonEffect.visible)
                }
            }


            MouseArea {          // Rear Defrost Button Mouse Area and Effect
                id: rearDefrost
                x: 323
                y: 118
                width: 143
                height: 77

                Image {
                    id: rearDefrostButtonEffect
                    x: 16
                    y: -7
                    width: 113
                    height: 84
                    anchors.bottomMargin: 0
                    anchors.topMargin: -7
                    anchors.leftMargin: 16
                    anchors.rightMargin: 14
                    anchors.fill: parent
                    visible: false
                    source: "UIPictures/acUp.png"
                }

                Timer {                     // Timer limiting on/off frequency of Rear defrost. Current CAN signals require a min 3 second delay
                    /*
                                          A 3 second delay timer starts when the rear defrost button has been pressed. The button is disabled during
                                          this time frame. Once the delay has expired, user may again press the defrost button(s) to change their state.
                                        */
                    id: rearDefrostTimer;
                    interval: 5000;
                    running: false;
                    repeat: false;
                    onTriggered:{

                        switch (rearDefTimerState) {


                            case "rearDef": {                                // Re-enable rear defrost button; turn off timer; erase switch state.
                                MouseArea.visible = true;
                                rearDefTimerState: rearDefTimerState = " "
                                rearDefrostTimer.running = false;

                            } default: break

                        }
                    }

                }

                onClicked: {        // When Pressed, activate rear Defrost. Deactivate user input for 3s. (current CAN signals require this)

                    if (rearDefTimerState !== "rearDef") {            // Determine if timer is already running. If not, change state and send CAN message.
                        rearDefrostButtonEffect.visible = !rearDefrostButtonEffect.visible
                        AC_Controls.defrostR(rearDefrostButtonEffect.visible)

                    // Activate timer, disable button
                        rearDefTimerState: rearDefTimerState = "rearDef"
                        MouseArea.visible = false;
                        rearDefrostTimer.running = true;
                    }

                }
            }


            MouseArea {
                id: frontDefrost
                x: 217
                y: 86
                width: 80
                height: 58

                Timer {
                      /* Timer limiting on/off frequency of Front defrost. Current CAN signals require a min 3 second delay. The button is disabled during this time-
                         frame. Once the delay has expired, user may again press the defrost button(s) to change their state. */

                    id: frontDefrostTimer;
                     interval: 5000;
                    running: false;
                    repeat: false;
                    onTriggered:{

                        switch (frontDefTimerState) {


                            case "frontDef": {                                 // Re-enable rear defrost button; turn off timer; erase switch state.
                                MouseArea.visible = true;
                                // frontDefrostTimer.running = false;
                                frontDefTimerState: frontDefTimerState = " "

                            } default: break
                        }
                    }

                }

            Image {
            id: frontDefrostButtonEffect
            x: -5
            y: 0
            width: 84
            height: 58
            anchors.rightMargin: 1
            anchors.bottomMargin: 0
            anchors.leftMargin: -5
            anchors.topMargin: 0
            visible: false
            anchors.fill: parent
            source: "UIPictures/acWindow.png"
            }

                onPressed: {        // When Pressed, activate front Defrost. Deactivate user input for 3ms. (current CAN signals require this)

                    if (frontDefTimerState !== "frontDef") {            // Determine if timer is already running. If not, change state and send CAN message.
                        frontDefrostButtonEffect.visible = !frontDefrostButtonEffect.visible
                        AC_Controls.defrostF(frontDefrostButtonEffect.visible)

                        // Activate timer, disable button
                        frontDefTimerState: frontDefTimerState = "frontDef"
                        MouseArea.visible = false;
                        frontDefrostTimer.running = true;
                    }

                }

            }

            Slider {
                id: sliderDriver
                x: 485
                y: 164
                width: 263
                height: 36
                rotation: -180
                z: 1
                maximum: 100
                minimum: 0
                mode: 1
            }

            Slider {
                id: sliderPassenger
                x: 485
                y: 256
                width: 263
                height: 36
                rotation: -180
                z: 1
                maximum: 100
                minimum: 0
                mode: 2
            }

            Text {
                id: text1
                x: 530
                y: 200
                width: 180
                height: 33
                color: "#ffffff"
                text: qsTr("Passenger Temperature")
                verticalAlignment: Text.AlignVCenter
                scale: 1
                font.bold: true
                font.pointSize: 14
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 12
            }

            Text {
                id: text2
                x: 546
                y: 292
                width: 141
                height: 28
                color: "#ffffff"
                text: qsTr("Driver Temperature")
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 12
                font.bold: true
                scale: 1
                font.pointSize: 14
                horizontalAlignment: Text.AlignHCenter
            }

            Rectangle {
                id: rectangle1
                x: 612
                y: 50
                width: 10
                height: 263
                z: 0
                gradient: Gradient {
                    GradientStop {
                        position: 0
                        color: "#7c79e6"
                    }

                    GradientStop {
                        position: 1
                        color: "#d54545"
                    }
                }
                rotation: -90
            }

            Rectangle {
                id: rectangle2
                x: 599
                y: 142
                width: 36
                height: 263
                rotation: -90
                z: 0
                gradient: Gradient {
                    GradientStop {
                        position: 0
                        color: "#7c79e6"
                    }

                    GradientStop {
                        position: 1
                        color: "#d54545"
                    }
                }
            }

            Rectangle {
                id: fanspeed1
                x: 565
                y: 90
                width: 22
                height: 49
                gradient: Gradient {
                    GradientStop {
                        position: 0.54
                        color: "#2588af"
                    }

                    GradientStop {
                        position: 1
                        color: "#fdfdfd"
                    }
                }
                visible: false
            }

            Rectangle {
                id: fanspeed2
                x: 599
                y: 90
                width: 22
                height: 49
                gradient: Gradient {
                    GradientStop {
                        position: 0.54
                        color: "#2588af"
                    }

                    GradientStop {
                        position: 1
                        color: "#fdfdfd"
                    }
                }
                visible: false
            }

            Rectangle {
                id: fanspeed3
                x: 635
                y: 90
                width: 22
                height: 49
                gradient: Gradient {
                    GradientStop {
                        position: 0.54
                        color: "#2588af"
                    }

                    GradientStop {
                        position: 1
                        color: "#fdfdfd"
                    }
                }
                visible: false
            }

            Rectangle {
                id: fanspeed4
                x: 672
                y: 90
                width: 22
                height: 49
                gradient: Gradient {
                    GradientStop {
                        position: 0.54
                        color: "#2588af"
                    }

                    GradientStop {
                        position: 1
                        color: "#fdfdfd"
                    }
                }
                visible: false
            }

            Text {
                id: text3
                x: 162
                y: 17
                width: 64
                height: 53
                color: "#f9f6f6"
                text: qsTr("off")
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 22
                font.bold: true
                font.pixelSize: 12
            }

            MouseArea {
                id: mousearea1
                x: 162
                y: 17
                width: 64
                height: 53
                onClicked: {
                    AC_Controls.fanspeed0()
                }
            }

//////////////////////////////////////////////////////////////////////////////////////////////////////
    //this section controls the fan speed
    //Variables used in FanLevel
   property int currentFanLevel        //Holds the current fan level state
   signal fanLevelIncrease             //Command to raise the fan level
   signal fanLevelDecrease             //Command to lower the fan level

   //Renamed properties. similair to #define in C. e.x. fan1 can be used in place of fanLevel1.opacity to control the opacity value
//   property alias fan1: fanLevel1.opacity
//   property alias fan2: fanLevel2.opacity
//   property alias fan3: fanLevel3.opacity
//   property alias fan4: fanLevel4.opacity
//   property alias fan5: fanLevel5.opacity

// Pictures from FanOff to FanLevel5 ( Displays/Hides the Fan Level segments as the fan is increased/decreased
//Image { id: fanLevelOff; anchors.fill: parent; source: "UIPictures/ProofOfConcept/FanLevelBar/FanLevelBar_Off.png" }

//Image { id: fanLevel1; x: 0; y: 0; opacity: 0; visible: true; anchors.fill: parent; source: "UIPictures/ProofOfConcept/FanLevelBar/FanLevelBar_1.png" }

//Image { id: fanLevel2; x: 0; y: 0; opacity: 0; visible: true; source: "UIPictures/ProofOfConcept/FanLevelBar/FanLevelBar_2.png" }

//Image { id: fanLevel3; x: 0; y: 0; opacity: 0; visible: true; source: "UIPictures/ProofOfConcept/FanLevelBar/FanLevelBar_3.png" }

//Image { id: fanLevel4; x: 0; y: 0; opacity: 0; visible: true; source: "UIPictures/ProofOfConcept/FanLevelBar/FanLevelBar_4.png" }

//Image { id: fanLevel5; x: 0; y: 0; opacity: 0; visible: true; source: "UIPictures/ProofOfConcept/FanLevelBar/FanLevelBar_5.png" }

// Handles fanIncrease and fanDecrease Signals from POC_Layout
currentFanLevel: { currentFanLevel = 0 }

onFanLevelIncrease: {                       // When the fan level increase button is pressed, adjust the visible fan level bar
if (currentFanLevel != 5) {                     // If the fan level is not at its maximum
   if (fan1 === 0) {                           // And if fan level bar 1 is not visible (meaning the fan level is off, increase to level 1
       fan1 = 1                                // Make Fan Level bar 1 visible
       currentFanLevel: currentFanLevel += 1   // Increase fan level by 1
   } else if (fan2 === 0) {                    // Repeats above steps for increasing to fan level 2
       fan2 = 1
       currentFanLevel: currentFanLevel += 1
   } else if (fan3 === 0) {                    // Repeats above steps for increasing to fan level 3
       fan3 = 1
       currentFanLevel: currentFanLevel += 1
   } else if (fan4 === 0) {                    // Repeats above steps for increasing to fan level 4
       fan4 = 1
       currentFanLevel: currentFanLevel += 1
   } else if (fan5 === 0) {                    // Repeats above steps for increasing to fan level 5
       fan5 = 1
       currentFanLevel: currentFanLevel += 1
   }
}
AC_Controls.fanLevel(currentFanLevel);          //Updates the AC_Controls header file with the fan speed
}

onFanLevelDecrease: {                           // When the fan level decrease button is pressed, adjust the visible fan level bar
if (currentFanLevel != 0) {                     // If the fan level is not at its minimum
   if (fan5 === 1) {                           // And if fan level bar 5 is visible (meaning the fan level is at its max, decrease to level 4
       fan5 = 0                                // Hide Fan Level bar 5 (make it not visible)
       currentFanLevel: currentFanLevel -= 1   // Decrease fan level by 1
   } else if (fan4 === 1) {                    // Repeats above steps for decreasing to fan level 3
       fan4 = 0
       currentFanLevel: currentFanLevel -= 1
   } else if (fan3 === 1) {                    // Repeats above steps for decreasing to fan level 2
       fan3 = 0
       currentFanLevel: currentFanLevel -= 1
   } else if (fan2 === 1) {                    // Repeats above steps for decreasing to fan level 1
       fan2 = 0
       currentFanLevel: currentFanLevel -= 1
   } else if (fan1 === 1) {                    // Repeats above steps for decreasing to fan level off (level 0)
       fan1 = 0
       currentFanLevel: currentFanLevel -= 1
   }
}
AC_Controls.fanLevel(currentFanLevel);          //Updates the AC_Controls header file with the fan speed
}



}
