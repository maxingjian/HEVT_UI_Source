import QtQuick 1.0

Image{
    id: radioPage1
    x: 0
    y: 0
    z: -1
    opacity: 1
    source:"UIPictures/Home Screens/radio.png"
    //this section is used to initialize all the variables needed for radio page
    /* Define and Initialize Variable used in Radio processes */
    property string busMessage                                                      // CAN message carrier for Radio Bus
    property string radioPowerTimerState:"off"                                      // Holds Radio Power button status (on / off) *Default off
    property string radioPowerMessage: "0x244 0x07 0xAE 0X01 0X10 0X0 0X0 0X0 0X0"  // CAN Message for radio ON / OFF
    property string keypressed                                                      // Stores name of button most recently asserted (prints to terminal for debugging)
    property int volumeLevel: 0x40                                                  // Control byte for Volume level  initialized @ 25%
    property int radioSaveOpacity1: 0
    property int radioSaveOpacity2: 0
    property int radioSaveOpacity3: 0
    property int radioSaveOpacity4: 0
    property int radioSaveOpacity5: 0
    property int radioSaveOpacity6: 0
    property int fmButtonOpacity: 1
    property int amButtonOpacity: 0
    property int radioPower: 0
    property int fadeLevel: 0x80                                                    // Control byte for Fade level  *Default 0
    property int balanceLevel: 0x80                                                 // Control byte for Balance level * Default 0
    property int bassLevel: 0x4D                                                    // Control byte for Bass level  *Default 30%
    property int midLevel: 0x4D                                                     // Control byte for Mid tone level *Default 30%
    property int trebleLevel: 0x4D                                                  // Control byte for Treble level *Default 30%
    property string volumeState                                                     // Timer trigger variable for volume up / down
    property string fadeState                                                       // Timer trigger variable for volume up / down
    property string balanceState                                                    // Timer trigger variable for volume up / down
    property string bassState                                                       // Timer trigger variable for volume up / down
    property string midState                                                        // Timer trigger variable for volume up / down
    property string trebleState                                                     // Timer trigger variable for volume up / down
    property string bugMessage: volumeLevel					    // Debug message transport
    //end of variable initialization


/*
  This is the radio save buttons. The defaule for the buttons is the "1" is glowing all the rest are
  not showing.


  */
Image{
    id: radioSaveButton1
    x: 178
    y: 187
    opacity: radioSaveOpacity1
    source: "UIPictures/Buttons/Radio Buttons/1active.png"
}
Image{
    id: radioSaveButton2
    x: 265.5
    y: 177
    opacity: radioSaveOpacity2
    source: "UIPictures/Buttons/Radio Buttons/2active.png"
}
Image{
    id: radioSaveButton3
    x: 335
    y: 174
    opacity: radioSaveOpacity3
    source: "UIPictures/Buttons/Radio Buttons/3active.png"
}
Image{
    id: radioSaveButton4
    x: 417.5
    y: 166
    opacity: radioSaveOpacity4
    source: "UIPictures/Buttons/Radio Buttons/4active.png"
}
Image{
    id: radioSaveButton5
    x: 481
    y: 166
    opacity: radioSaveOpacity5
    source: "UIPictures/Buttons/Radio Buttons/5active.png"
}

Image{
    id: radioSaveButton6
    x: 573
    y: 169
    opacity: radioSaveOpacity6
    source: "UIPictures/Buttons/Radio Buttons/6active.png"
}


// When a user touches one of the save buttones (1-6) first the progam checks to see
// it the radio is on. If it isn't the numbers do not change, it if is on then the
// coresponding number will be chosen.
//
// As of right now we cannot read the actual FM stations so we cannot save those stations.
// So right now these buttons just light up but do not actually do anything
    MouseArea{
        id: radioSaveM1
        x:290
        y:285
        width: 80
        height: 72
        onClicked: {
            if(radioPowerTimerState == "on")
            {
                radioSaveButton1.opacity = 1
                radioSaveButton2.opacity = 0
                radioSaveButton3.opacity = 0
                radioSaveButton4.opacity = 0
                radioSaveButton5.opacity = 0
                radioSaveButton6.opacity = 0

                radioSaveOpacity1       = radioSaveButton1.opacity
                radioSaveOpacity2       = radioSaveButton2.opacity
                radioSaveOpacity3       = radioSaveButton3.opacity
                radioSaveOpacity4       = radioSaveButton4.opacity
                radioSaveOpacity5       = radioSaveButton5.opacity
                radioSaveOpacity6       = radioSaveButton6.opacity
            }
        }

    }
    MouseArea{
        id: radioSaveM2
        x:370
        y:285
        width: 80
        height: 72
        onClicked: {
            if(radioPowerTimerState == "on")
            {
                radioSaveButton1.opacity = 0
                radioSaveButton2.opacity = 1
                radioSaveButton3.opacity = 0
                radioSaveButton4.opacity = 0
                radioSaveButton5.opacity = 0
                radioSaveButton6.opacity = 0

                radioSaveOpacity1       = radioSaveButton1.opacity
                radioSaveOpacity2       = radioSaveButton2.opacity
                radioSaveOpacity3       = radioSaveButton3.opacity
                radioSaveOpacity4       = radioSaveButton4.opacity
                radioSaveOpacity5       = radioSaveButton5.opacity
                radioSaveOpacity6       = radioSaveButton6.opacity
            }
        }
    }
    MouseArea{
        id: radioSaveM3
        x:450
        y:285
        width: 80
        height: 72
        onClicked: {
            if(radioPowerTimerState == "on")
            {
                radioSaveButton1.opacity = 0
                radioSaveButton2.opacity = 0
                radioSaveButton3.opacity = 1
                radioSaveButton4.opacity = 0
                radioSaveButton5.opacity = 0
                radioSaveButton6.opacity = 0

                radioSaveOpacity1       = radioSaveButton1.opacity
                radioSaveOpacity2       = radioSaveButton2.opacity
                radioSaveOpacity3       = radioSaveButton3.opacity
                radioSaveOpacity4       = radioSaveButton4.opacity
                radioSaveOpacity5       = radioSaveButton5.opacity
                radioSaveOpacity6       = radioSaveButton6.opacity
            }
        }
    }
    MouseArea{
        id: radioSaveM4
        x:530
        y:285
        width: 80
        height: 72
        onClicked: {
            if(radioPowerTimerState == "on")
            {
                radioSaveButton1.opacity = 0
                radioSaveButton2.opacity = 0
                radioSaveButton3.opacity = 0
                radioSaveButton4.opacity = 1
                radioSaveButton5.opacity = 0
                radioSaveButton6.opacity = 0

                radioSaveOpacity1       = radioSaveButton1.opacity
                radioSaveOpacity2       = radioSaveButton2.opacity
                radioSaveOpacity3       = radioSaveButton3.opacity
                radioSaveOpacity4       = radioSaveButton4.opacity
                radioSaveOpacity5       = radioSaveButton5.opacity
                radioSaveOpacity6       = radioSaveButton6.opacity
            }
        }
    }
    MouseArea{
        id: radioSaveM5
        x:610
        y:285
        width: 80
        height: 72
        onClicked: {
            if(radioPowerTimerState == "on")
            {
                radioSaveButton1.opacity = 0
                radioSaveButton2.opacity = 0
                radioSaveButton3.opacity = 0
                radioSaveButton4.opacity = 0
                radioSaveButton5.opacity = 1
                radioSaveButton6.opacity = 0

                radioSaveOpacity1       = radioSaveButton1.opacity
                radioSaveOpacity2       = radioSaveButton2.opacity
                radioSaveOpacity3       = radioSaveButton3.opacity
                radioSaveOpacity4       = radioSaveButton4.opacity
                radioSaveOpacity5       = radioSaveButton5.opacity
                radioSaveOpacity6       = radioSaveButton6.opacity
            }
        }
    }
        MouseArea{
            id: radioSaveM6
            x:690
            y:285
            width: 80
            height: 72

            onClicked: {
                if(radioPowerTimerState == "on")
                {
                    radioSaveButton1.opacity = 0
                    radioSaveButton2.opacity = 0
                    radioSaveButton3.opacity = 0
                    radioSaveButton4.opacity = 0
                    radioSaveButton5.opacity = 0
                    radioSaveButton6.opacity = 1

                    radioSaveOpacity1       = radioSaveButton1.opacity
                    radioSaveOpacity2       = radioSaveButton2.opacity
                    radioSaveOpacity3       = radioSaveButton3.opacity
                    radioSaveOpacity4       = radioSaveButton4.opacity
                    radioSaveOpacity5       = radioSaveButton5.opacity
                    radioSaveOpacity6       = radioSaveButton6.opacity
                }
            }

    }

    Image{
        id: scan
        x: -87
        y: 188
        opacity: 0
        source:"UIPictures/Buttons/Radio Buttons/scanactive.png"
    }
    //this button is currently implemented as send out a channel seek up button every 1 second. as soon as the scan
    //button is pressed again, the readio will stop seek channels.

    MouseArea{
        id: scanButton
        x: 13
        y: 303
        width: 114
        height: 63
        opacity: 1
        Timer{
            id: scanTimer
            interval: 1000;
            running: false;
            repeat: true;
            onTriggered:{
                busMessage:busMessage = "0x244 0x07 0xAE 0X05 0X40 0X0 0X01 0X0 0X0"
                keypressed:keypressed = "Seek Up"
                RadioUnit.radioBus(busMessage, keypressed)  // Send CAN message onto bus
                RadioUnit.radioPwr(radioPowerMessage,radioPowerTimerState)  //send CAN message, along with Debug messsage declaring radio state (on/off)
            }
        }
        onClicked:{
            if (radioPowerTimerState == "on")
            {
                if(scan.opacity == 1){
                    scan.opacity = 0
                    scanTimer.stop()
                }
                else{
                    scan.opacity = 1
                    scanTimer.start()
                    busMessage:busMessage = "0x244 0x07 0xAE 0X05 0X40 0X0 0X01 0X0 0X0"
                    keypressed:keypressed = "Seek Up"
                    RadioUnit.radioBus(busMessage, keypressed)  // Send CAN message onto bus
                }
            }
        }
    }
////////////////////this is the volume section
    Image{
        id: vol1
        x: 9
        y: 110
        opacity: 0
        source:"UIPictures/vol1.png"
    }
    Image{
        id: vol2
        x: 9
        y: 110
        opacity: 0
        source:"UIPictures/vol2.png"
    }
    Image{
        id: vol3
        x: 9
        y: 110
        opacity: 0
        source:"UIPictures/vol3.png"
    }
    Image{
        id: vol4
        x: 9
        y: 110
        opacity: 0
        source:"UIPictures/vol4.png"
    }
    Image{
        id: vol5
        x: 9
        y: 110
        opacity: 0
        source:"UIPictures/vol5.png"
    }
    //this is a function used to take care of the display of the five volume bars.
    function volumeDisplay(){
        if(volumeLevel<=0){
            vol1.opacity =0
            vol2.opacity =0
            vol3.opacity =0
            vol4.opacity =0
            vol5.opacity =0
        }
        else if(volumeLevel>0 && volumeLevel<=0x33){
            vol1.opacity =1
            vol2.opacity =0
            vol3.opacity =0
            vol4.opacity =0
            vol5.opacity =0
        }

        else if(volumeLevel>0x33 && volumeLevel<=0x66){
            vol1.opacity =0
            vol2.opacity =1
            vol3.opacity =0
            vol4.opacity =0
            vol5.opacity =0
        }
        else if(volumeLevel>0x66 && volumeLevel<=0x99){
            vol1.opacity =0
            vol2.opacity =0
            vol3.opacity =1
            vol4.opacity =0
            vol5.opacity =0
        }
        else if(volumeLevel>0x99 && volumeLevel<=0xCC){
            vol1.opacity =0
            vol2.opacity =0
            vol3.opacity =0
            vol4.opacity =1
            vol5.opacity =0
        }
        else if(volumeLevel>0xCC && volumeLevel<=0xFF){
            vol1.opacity =0
            vol2.opacity =0
            vol3.opacity =0
            vol4.opacity =0
            vol5.opacity =1
        }
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////
// //this section is to turn on and off the radio
    Image{
        id:radioOn
        x: -81
        y: -40
        opacity: 0
        source: "UIPictures/Buttons/Radio Buttons/onactive.png"
    }
    Image{
        id:radioOff
        x:45
        y:-18
        opacity: 1
        source: "UIPictures/Buttons/Radio Buttons/offactive.png"
    }

//    //this section is used to turn on and off the radio
//    MouseArea{
//        id: radioOffButton
//        x: 117
//        y: 20
//        width: 107
//        height: 48
//        onClicked: {
//            if(radioOff.opacity == 1){
//                RadioUnit.radioPwr("0x244 0x07 0xAE 0X01 0X10 0X10 0X0 0X0 0X0","on");
//                radioOff.opacity = 0
//            }
//            else{
//                RadioUnit.radioPwr("0x244 0x07 0xAE 0X01 0X10 0X0 0X0 0X0 0X0","off");
//                radioOff.opacity = 1
//            }
//        }
//    }
//////////////////////////////////////////////////////////////////////////////////////////////////////
//this section takes care of the volume

//Image{
//    id: volumePic
//    x: 26
//    y: 93.5
//    opacity: 0
//    source:"UIPictures/volumeBar.png"
//}
//MouseArea{
//    id: volumeButton
//    x: 26
//    y: 90
//    width: 39
//    height: 197
//    onClicked:{
//        if(volumePic.opacity == 1){
//            RadioUnit.radioBus("0x244 0x07 0xAE 0X01 0X40 0X0 0X0 0X 0X0","Volume Down");
//            volumePic.opacity = 0
//        }
//        else{
//            RadioUnit.radioBus("0x244 0x07 0xAE 0X01 0X40 0X0 0X0 0XFF 0X0","Volume Up");
//            volumePic.opacity = 1
//        }
//    }
//}
//////////////////////////////////////////////////////////////////////////////////above is my code, this is original code



    // On button
    MouseArea {
        id: mouseAreaRadioPoweron
        x: 13
        y: 78
        width: 114
        height: 63

//        Timer {
//              /* This timer keeps the vehicle in 'diagnostics mode' by repeating the 'radio on' or 'radio off' can message in 3 second intervals. On boot,
//                the timer will begin sending 'radio off' signals. When the user clicks the radio power button, the timer will toggle the radio-off / radio-on
//                signal. */
//            id: radioPowerTimer;
//            interval: 3000;
//            running: true;
//            repeat: true;
//            onTriggered:{
//                RadioUnit.radioPwr(radioPowerMessage,radioPowerTimerState)  //send CAN message, along with Debug messsage declaring radio state (on/off)
//            }
//        }
        onClicked: {  // Turn radio on or off, once button is asserted.
            /* Determine current state of radio and send appropriate message onto CAN bus */
                radioPowerTimerState: radioPowerTimerState = "on"
                radioPowerMessage: radioPowerMessage = "0x244 0x07 0xAE 0X01 0X10 0X10 0X0 0X0 0X0"
                radioOn.opacity = 1
                radioOff.opacity = 0
                radioSaveButton1.opacity = radioSaveOpacity1
                radioSaveButton2.opacity = radioSaveOpacity2
                radioSaveButton3.opacity = radioSaveOpacity3
                radioSaveButton4.opacity = radioSaveOpacity4
                radioSaveButton5.opacity = radioSaveOpacity5
                radioSaveButton6.opacity = radioSaveOpacity6
                fmPic.opacity = fmButtonOpacity
                amPic.opacity = amButtonOpacity

            }
        }

    // Off button
    MouseArea {
        id: mouseAreaRadioPoweroff
        x: 141
        y: 78
        width: 114
        height: 63
        onClicked: {  // Turn radio on or off, once button is asserted.

            /* Determine current state of radio and send appropriate message onto CAN bus */
            radioPowerTimerState: radioPowerTimerState = "off"
            radioPowerMessage: radioPowerMessage = "0x244 0x07 0xAE 0X01 0X10 0X0 0X0 0X0 0X0"
            radioOn.opacity = 0
            radioOff.opacity = 1
            radioSaveButton1.opacity = 0
            radioSaveButton2.opacity = 0
            radioSaveButton3.opacity = 0
            radioSaveButton4.opacity = 0
            radioSaveButton5.opacity = 0
            radioSaveButton6.opacity = 0
            fmPic.opacity = 0
            amPic.opacity = 0
            // If the radio is scanning then turn off the scanner
            if (scan.opacity == 1)
            {
                scan.opacity = 0
                scanTimer.stop()
            }
        }
    }

//this takes care of the volume for the car
/*MouseArea {
    id: mouseAreaVolumeDown
    x: 20
    y: 210
    width: 55
    height: 68

    onClicked: {   // When Volume Down button is pressed, The speaker volume decreases
        busMessage:busMessage = "0x244 0x07 0xAE 0X01 0X40 0X0 0X0 "+volumeLevel+" 0X0"        // Create CAN message

        if (volumeLevel > 0) {             // Keep speaker volume within viable range (not lower than 0x0)
            volumeLevel -= 0x05;
            if(volumeLevel <= 0) { volumeLevel = 0; }
        }
        keypressed:keypressed = "Vomume Down"  // Debug Message
        RadioUnit.radioBus(busMessage, keypressed) // Send CAN message onto bus
    }

    onPressAndHold: {   // When Volume Down button is held, The volume level decrement speed increases

        volumeState: volumeState = "volumeDown"  // value read by 'volumeTimer' to determine if volume is to be increased or decreased
        volumeTimer.running = true
    }

    onReleased: {                 // Turn off timer and reset Timer delay
        volumeTimer.running = false
        volumeTimer.interval = 500;
        volumeDisplay()
        //after finished with volume, change the volume bar levels
//        if(volumeLevel<=0){
//            vol1.opacity =0
//            vol2.opacity =0
//            vol3.opacity =0
//            vol4.opacity =0
//            vol5.opacity =0
//        }
//        else if(volumeLevel>0 && volumeLevel<=0x33){
//            vol1.opacity =1
//            vol2.opacity =0
//            vol3.opacity =0
//            vol4.opacity =0
//            vol5.opacity =0
//        }

//        else if(volumeLevel>0x33 && volumeLevel<=0x66){
//            vol1.opacity =0
//            vol2.opacity =1
//            vol3.opacity =0
//            vol4.opacity =0
//            vol5.opacity =0
//        }
//        else if(volumeLevel>0x66 && volumeLevel<=0x99){
//            vol1.opacity =0
//            vol2.opacity =0
//            vol3.opacity =1
//            vol4.opacity =0
//            vol5.opacity =0
//        }
//        else if(volumeLevel>0x99 && volumeLevel<=0xCC){
//            vol1.opacity =0
//            vol2.opacity =0
//            vol3.opacity =0
//            vol4.opacity =1
//            vol5.opacity =0
//        }
//        else if(volumeLevel>0xCC && volumeLevel<=0xFF){
//            vol1.opacity =0
//            vol2.opacity =0
//            vol3.opacity =0
//            vol4.opacity =0
//            vol5.opacity =1
//        }
    }
    }

MouseArea {
    id: mouseAreaVolumeUp
    x: 20
    y: 109
    width: 55
    height: 77

    onClicked: {   // When Volume Up button is pressed, The speaker volume increases

        busMessage:busMessage = "0x244 0x07 0xAE 0X01 0X40 0X0 0X0 "+volumeLevel+" 0X0"        // Create CAN message
        if (volumeLevel < 0xFF) {                              // Keep speaker volume within viable range (not higher than 0xFF)
            volumeLevel += 0x05;
            if(volumeLevel >= 0xFF) { volumeLevel = 0xFF; }
        }
        keypressed:keypressed = "Vomume Up"  // Debug Message
        RadioUnit.radioBus(busMessage, keypressed) // Send CAN message onto bus
    }

    onPressAndHold: {   // When Volume Up button held, The speaker volume increases rapidly

        volumeState: volumeState = "volumeUp"   // value read by 'volumeTimer' to determine if volume is to be increased or decreased
        volumeTimer.running = true
    }

    onReleased: {
        volumeTimer.running = false
        volumeTimer.interval = 500;
        volumeDisplay()
        //after finished with volume, change the volume bar levels
//        if(volumeLevel<=0){
//            vol1.opacity =0
//            vol2.opacity =0
//            vol3.opacity =0
//            vol4.opacity =0
//            vol5.opacity =0
//        }
//        else if(volumeLevel>0 && volumeLevel<=0x33){
//            vol1.opacity =1
//            vol2.opacity =0
//            vol3.opacity =0
//            vol4.opacity =0
//            vol5.opacity =0
//        }

//        else if(volumeLevel>0x33 && volumeLevel<=0x66){
//            vol1.opacity =0
//            vol2.opacity =1
//            vol3.opacity =0
//            vol4.opacity =0
//            vol5.opacity =0
//        }
//        else if(volumeLevel>0x66 && volumeLevel<=0x99){
//            vol1.opacity =0
//            vol2.opacity =0
//            vol3.opacity =1
//            vol4.opacity =0
//            vol5.opacity =0
//        }
//        else if(volumeLevel>0x99 && volumeLevel<=0xCC){
//            vol1.opacity =0
//            vol2.opacity =0
//            vol3.opacity =0
//            vol4.opacity =1
//            vol5.opacity =0
//        }
//        else if(volumeLevel>0xCC && volumeLevel<=0xFF){
//            vol1.opacity =0
//            vol2.opacity =0
//            vol3.opacity =0
//            vol4.opacity =0
//            vol5.opacity =1
//        }
    }
}

Timer {  /* When Volume up or down button is held in asserted position (pressed), the speaker volume will increase/decrease at a faster pace. Delay starts at-
            500 ms and decreases to 100ms */
/*
    id:volumeTimer;
    interval:500;
    running:false;
    repeat:true;
    onTriggered:{

        switch (volumeState) {

            case "volumeUp": {       // Increase speaker volume

                if (volumeLevel < 0xFF) {  // Keep speaker volume within viable range (not higher than 0xFF)
                    volumeLevel += 0x10;
                    if(volumeLevel >= 0xFF) { volumeLevel = 0xFF; }
                }
                busMessage:busMessage = "0x244 0x07 0xAE 0X01 0X40 0X0 0X0 "+volumeLevel+" 0X0"  // Create CAN message
                keypressed:keypressed = "Vomume Up"  // Debug Message
                RadioUnit.radioBus(busMessage, keypressed) // Send CAN message onto bus
                if (volumeTimer.interval > 100) {
                    volumeTimer.interval -= 50;                // Increase message send speed
                }
                volumeDisplay()
//                if(volumeLevel<=0){
//                    vol1.opacity =0
//                    vol2.opacity =0
//                    vol3.opacity =0
//                    vol4.opacity =0
//                    vol5.opacity =0
//                }
//                else if(volumeLevel>0 && volumeLevel<=0x33){
//                    vol1.opacity =1
//                    vol2.opacity =0
//                    vol3.opacity =0
//                    vol4.opacity =0
//                    vol5.opacity =0
//                }

//                else if(volumeLevel>0x33 && volumeLevel<=0x66){
//                    vol1.opacity =0
//                    vol2.opacity =1
//                    vol3.opacity =0
//                    vol4.opacity =0
//                    vol5.opacity =0
//                }
//                else if(volumeLevel>0x66 && volumeLevel<=0x99){
//                    vol1.opacity =0
//                    vol2.opacity =0
//                    vol3.opacity =1
//                    vol4.opacity =0
//                    vol5.opacity =0
//                }
//                else if(volumeLevel>0x99 && volumeLevel<=0xCC){
//                    vol1.opacity =0
//                    vol2.opacity =0
//                    vol3.opacity =0
//                    vol4.opacity =1
//                    vol5.opacity =0
//                }
//                else if(volumeLevel>0xCC && volumeLevel<=0xFF){
//                    vol1.opacity =0
//                    vol2.opacity =0
//                    vol3.opacity =0
//                    vol4.opacity =0
//                    vol5.opacity =1
//                }

            }return

            case "volumeDown":{  // Decrease speaker volume

                if (volumeLevel > 0x0) {       // Keep speaker volume within viable range (not lower than 0x0)
                    volumeLevel -= 0x10;
                    if(volumeLevel <= 0) { volumeLevel = 0; }
                }
                busMessage:busMessage = "0x244 0x07 0xAE 0X01 0X40 0X0 0X0 "+volumeLevel+" 0X0"  // Create CAN message
                keypressed:keypressed = "Vomume Down"  // Debug Message
                RadioUnit.radioBus(busMessage, keypressed) // Send CAN message onto bus
                if (volumeTimer.interval > 100) {
                    volumeTimer.interval -= 50;                 // Increase message send speed
                }
                volumeDisplay()
//                if(volumeLevel<=0){
//                    vol1.opacity =0
//                    vol2.opacity =0
//                    vol3.opacity =0
//                    vol4.opacity =0
//                    vol5.opacity =0
//                }
//                else if(volumeLevel>0 && volumeLevel<=0x33){
//                    vol1.opacity =1
//                    vol2.opacity =0
//                    vol3.opacity =0
//                    vol4.opacity =0
//                    vol5.opacity =0
//                }

//                else if(volumeLevel>0x33 && volumeLevel<=0x66){
//                    vol1.opacity =0
//                    vol2.opacity =1
//                    vol3.opacity =0
//                    vol4.opacity =0
//                    vol5.opacity =0
//                }
//                else if(volumeLevel>0x66 && volumeLevel<=0x99){
//                    vol1.opacity =0
//                    vol2.opacity =0
//                    vol3.opacity =1
//                    vol4.opacity =0
//                    vol5.opacity =0
//                }
//                else if(volumeLevel>0x99 && volumeLevel<=0xCC){
//                    vol1.opacity =0
//                    vol2.opacity =0
//                    vol3.opacity =0
//                    vol4.opacity =1
//                    vol5.opacity =0
//                }
//                else if(volumeLevel>0xCC && volumeLevel<=0xFF){
//                    vol1.opacity =0
//                    vol2.opacity =0
//                    vol3.opacity =0
//                    vol4.opacity =0
//                    vol5.opacity =1
//                }
            }return
            default: break
        }
    }
}*/
//////////////////////////
//AM selection
Image{
    id: amPic
    x: -78
    y: 42
    opacity: 0
    source: "UIPictures/Buttons/Radio Buttons/amactive.png"
}
MouseArea{
    id: amButton
    x: 13
    y: 153
    width: 114
    height: 63
    onClicked: {   // When AM button pressed, change radio band to AM
        if (radioPowerTimerState == "on")
        {
            fmPic.opacity = 0
            amPic.opacity = 1
            fmButtonOpacity = fmPic.opacity
            amButtonOpacity = amPic.opacity
            busMessage:busMessage = "0x244 0x07 0xAE 0X01 0X80 0X02 0X0 0X0 0X0"
            keypressed:keypressed = "AM"
            RadioUnit.radioBus(busMessage, keypressed) // Send CAN message onto bus
        }
    }
}
//FM selection
//Image{
//    id: fmPic
//    x: 178
//    y: 119
//    source:"UIPictures/FM.png"
//}
Image{
    id: fmPic
    x: 42
    y: 35.5
    opacity: 0
    source: "UIPictures/Buttons/Radio Buttons/fmactive.png"

}


MouseArea{
    id: fmButton
    x: 141
    y: 153
    width: 114
    height: 63
    onClicked: {   // When FM button pressed, change radio band to FM
        if (radioPowerTimerState == "on")
        {
            fmPic.opacity = 1
            amPic.opacity = 0
            fmButtonOpacity = fmPic.opacity
            amButtonOpacity = amPic.opacity
            busMessage:busMessage = "0x244 0x07 0xAE 0X01 0X80 0X01 0X0 0X0 0X0"
            keypressed:keypressed = "FM"
            RadioUnit.radioBus(busMessage, keypressed) // Send CAN message onto bus
        }
    }
}


Image{
    id: seekLeftImage
    x: -108
    y: 115.8
    opacity: 0
    source: "UIPictures/Buttons/Radio Buttons/seekleftarrowpressed.png"
}

MouseArea {
    id: mouseAreaSeekLeft
    x: 13
    y: 227
    width: 63
    height: 63
    onPressed:
    {
        if(radioPowerTimerState == "on")
        {
            seekLeftImage.opacity = 1;
        }
    }
    onReleased:
    {
      seekLeftImage.opacity = 0
    }
    onClicked: {   // When Seek Left(down) button pressed, decrement current radio station channel
        if(radioPowerTimerState == "on")
            {
            busMessage:busMessage = "0x244 0x07 0xAE 0X05 0X40 0X0 0X02 0X0 0X0"
            keypressed:keypressed = "Seek Down"
            RadioUnit.radioBus(busMessage, keypressed)  // Send CAN message onto bus
        }
    }
}

Image{
    id: seekRightImage
    x: 82.5
    y: 119
    opacity: 0
    source: "UIPictures/Buttons/Radio Buttons/seekrightarrowpressed.png"
}

MouseArea {
    id: mouseAreaSeekRight
    x: 192
    y: 227
    width: 63
    height: 63

    onPressed:
    {
        if(radioPowerTimerState == "on")
        {
            seekRightImage.opacity = 1;
        }
    }
    onReleased:
    {
      seekRightImage.opacity = 0
    }
    onClicked: {   // When Seek Right(up) button pressed, increment current radio station channel
        if(radioPowerTimerState == "on")
        {
            busMessage:busMessage = "0x244 0x07 0xAE 0X05 0X40 0X0 0X01 0X0 0X0"
            keypressed:keypressed = "Seek Up"
            RadioUnit.radioBus(busMessage, keypressed)  // Send CAN message onto bus
        }
    }
}

MouseArea {
    id: mouseAreaSeekLeft1
    x: 411
    y: 215
    width: 173
    height: 32
    onClicked: {   // When Seek Left(down) button pressed, decrement current radio station channel
        busMessage:busMessage = "0x244 0x07 0xAE 0X05 0X40 0X0 0X02 0X0 0X0"
        keypressed:keypressed = "Seek Down"
        RadioUnit.radioBus(busMessage, keypressed)  // Send CAN message onto bus
    }
}

MouseArea {
    id: mouseAreaSeekRight1
    x: 584
    y: 215
    width: 184
    height: 32

    onClicked: {   // When Seek Right(up) button pressed, increment current radio station channel
        busMessage:busMessage = "0x244 0x07 0xAE 0X05 0X40 0X0 0X01 0X0 0X0"
        keypressed:keypressed = "Seek Up"
        RadioUnit.radioBus(busMessage, keypressed)  // Send CAN message onto bus
    }
}
Image{
    id: volSettingPic
    x: 618
    y: 254
    opacity: 0
    source: "UIPictures/Buttons/Radio Buttons/settingsactive.png"
}


MouseArea{
    id: mouseAreavoSettingPic
    x: 730
    y: 380
    width: 63
    height: 63
    onPressed: {
        volSettingPic.opacity = 1;
    }
    onReleased: {
        volSettingPic.opacity = 0;
        volSettingPage.opacity = 1;
        radioPage1.opacity = 0;
        volSettingPage.z = 1;
        radioPage1.z = 0;
    }
}


Text {
    id: radioDisplay
    x: 430
    y: 160
    width: 213
    height: 73
    text: qsTr("Station")
    font.pixelSize: 60
}

}
