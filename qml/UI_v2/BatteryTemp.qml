import QtQuick 1.0

/*//Image{
//    id: battPage
//    x: 0
//    y: 0
//    z: -1
//    opacity: 1
//    source:"UIPictures/Battery Pics/normalbattery.png"
//    property int socAngle: 0
//    property int battTempAngle: 0
//    property int battCurAngle: 0
//    property int hokieFlag:1

//    Connections{
//      target: CanControl
//        onVeh_mode_recieved:{
//            target: energyPic
//            text1.text = veh_mode;
//            console.log("veh_mode")
//        }
//        onBatt_temp_recieved:{
//            text2.text = bett_temp;
//        }
//        onBatt_soc_recieved:{
//           text3.text = batt_soc;
//        }
//       onBatt_current_recieved:{
//            text4.text = batt_current;
//            CanControl.recieve_nb("1638")
//        }
        //        void veh_mode_recieved(QString veh_mode);
        //        void batt_temp_recieved(QString bett_temp);
        //        void batt_soc_recieved(QString batt_soc);
        //        void batt_current_recieved(QString batt_current);

        //            target: CanTest
        //            onTestChanged:{
        //                text1.text = number;
        //                console.log("signal",number)
        //        //    onImageChanged: console.log("Image has changed!")
        //            }
        //            onSignalChanged:{
        //                text2.text = number;
        //                console.log("2nd signal",number)
        //            }
//        }

//    Text {
//        id: text1
//        x: 150
//        y: 233
//        width: 91
//        height: 51
//        text: qsTr("Text")
//        font.pixelSize: 20
//    }*/
/*    Timer{
        id: startUpTimer
        interval: 500;
        running: true;
        repeat: false;
        onTriggered:{
            CanControl.recieve_nb("1638")
        }
    }*/
/*
//    MouseArea{
//        id: textButton
//        x: 179
//        y: 142
//        width: 172
//        height: 46
//        onClicked: {
//            CanControl.recieve_nb("1638")
//            //CanControl.testing();
//         #define MasterModule I2C1   //CanTest.signalTest();
//        }
//    }*/
/*    Text {
        id: text2
        x: 434
        y: 130
        width: 79
        height: 42
        text: qsTr("Temperature")
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 20
    }
    MouseArea{
        id: text2Button
        x:256 //define MasterModule I2C1#define MasterModule I2C1
        y:254
        width: 94
        height: 30
        onClicked: {
            CanTest.signalTest2();
        }
    }

    Text {
        id: text3
        x: 219
        y: 60
        width: 79
        height: 42
        text: qsTr("SOC")
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 20
    }
    MouseArea{
        id: text3Button
        x:413
        y:182
        width: 131
        height: 36
        onClicked: {
        }
    }

    Text {
        id: text4
        x: 271
        y: 210
        width: 79
        height: 42
        text: qsTr("Current")
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 20
    }
    //this is the implementation of a needle
    Image{
        id: socNeedle
        x: 232
        y: 46
        height: 105
        rotation: 0
        opacity: 1
        source:"UIPictures/needle.png"
        transformOrigin: Item.Bottom
    }
    MouseArea{
        id:needButton
        x: 0
        y: 0
        width: 100
        height: 100
        opacity: 1
        onClicked:{
            socAngle = socAngle + 10
            socNeedle.rotation = socAngle
        }
    }
    Image{
        id: battTemp
        x: 447
        y: 99
        rotation: 0
        opacity: 0
        source:"UIPictures/needle.png"
        transformOrigin: Item.Bottom
    }
    Image{
        id:battCurrent
        x: 286
        y: 182
        width: 42
        height: 97
        rotation: 0
        opacity: 0
        source:"UIPictures/needle.png"
        transformOrigin: Item.Bottom
    }
    Image{
        id: hokie1
        x: 704
        y: 243
        opacity: 0
        source:"UIPictures/print1.png"
    }
    Image{
        id: hokie2
        x: 733
        y: 175
        opacity: 0
        source:"UIPictures/print2.png"
    }
    Image{
        id: hokie3
        x: 671
        y: 150
        opacity: 0
        source:"UIPictures/print3.png"
    }
    Image{
        id: hokie4
        x: 692
        y: 72
        opacity: 0
        source:"UIPictures/print4.png"
    }
    Image{
        id: hokie5
        x: 611
        y: 60
        opacity: 0
        source:"UIPictures/print5.png"
    }
    Image{
        id: hokie6
        x: 631
        y: 3
        opacity: 0
        source:"UIPictures/print6.png"
    }
    Image{
        id: hokie7
        x: 531
        y: 4
        opacity: 0
        source:"UIPictures/print7.png"
    }

    //this section takes care of the hokie prints that shows on the screen, hokieprints are tied to a hokiePrintTimer
    //it interrupts at the interval time specified, and display glowing hokie prints one by one

    Timer{
        id: hokiePrintTimer;
        interval:1000;
        running:true;
        repeat:true;
        onTriggered:{
          //  console.log("hokie timer")
            if(hokieFlag==1){
                hokie1.opacity=1
                hokie2.opacity=0
                hokie3.opacity=0
                hokie4.opacity=0
                hokie5.opacity=0
                hokie6.opacity=0
                hokie7.opacity=0
            }
            else if(hokieFlag==2){
                hokie1.opacity=1
                hokie2.opacity=1
                hokie3.opacity=0
                hokie4.opacity=0
                hokie5.opacity=0
                hokie6.opacity=0
                hokie7.opacity=0
            }
            else if(hokieFlag==3){
                hokie1.opacity=1
                hokie2.opacity=1
                hokie3.opacity=1
                hokie4.opacity=0
                hokie5.opacity=0
                hokie6.opacity=0
                hokie7.opacity=0
            }
            else if(hokieFlag==4){
                hokie1.opacity=1
                hokie2.opacity=1
                hokie3.opacity=1
                hokie4.opacity=1
                hokie5.opacity=0
                hokie6.opacity=0
                hokie7.opacity=0
            }
            else if(hokieFlag==5){
                hokie1.opacity=1
                hokie2.opacity=1
                hokie3.opacity=1
                hokie4.opacity=1
                hokie5.opacity=1
                hokie6.opacity=0
                hokie7.opacity=0
            }
            else if(hokieFlag==6){
                hokie1.opacity=1
                hokie2.opacity=1
                hokie3.opacity=1
                hokie4.opacity=1
                hokie5.opacity=1
                hokie6.opacity=1
                hokie7.opacity=0
            }
            else if(hokieFlag==7){
                hokie1.opacity=1
                hokie2.opacity=1
                hokie3.opacity=1
                hokie4.opacity=1
                hokie5.opacity=1
                hokie6.opacity=1
                hokie7.opacity=1
            }
            else if(hokieFlag==8){
                hokie1.opacity=0
                hokie2.opacity=0
                hokie3.opacity=0
                hokie4.opacity=0
                hokie5.opacity=0
                hokie6.opacity=0
                hokie7.opacity=0
            }
            hokieFlag = hokieFlag+1
            if(hokieFlag>8){
                hokieFlag=1
            }
        }
    }
}*/


Image{
    Connections{
        target: CanControl
        onVeh_mode_recieved:{
            text1.text = veh_mode;
        }
        onBatt_temp_recieved:{
            text2.text = bett_temp;
        }
        onBatt_soc_recieved:{
            text3.text = batt_soc;
        }
        onBatt_current_recieved:{
            text4.text = batt_current;
            CanControl.recieve_nb("1638")
        }
        //        void veh_mode_recieved(QString veh_mode);
        //        void batt_temp_recieved(QString bett_temp);
        //        void batt_soc_recieved(QString batt_soc);
        //        void batt_current_recieved(QString batt_current);

        }

    id: battPage
    x: 0
    y: 0
    z: -1
    opacity: 1
    source:"UIPictures/Home Screens/normalbattery.png"
    property string modeTimer
    property string battChargeTimer
    property string battRateTimer
    property string battTempTimer
    property int currentTemp: 40
    property int battTempOffset: 40
    property int temp: 40
    property int timerValue: 0


    //Repeats every second to see if the mode has changed
    /*Timer{
        id: modeTimer
        interval: 1000;
        running: true;
        repeat: true;
        onTriggered: {
            if(text1 == series){
                battPage.source= "UIPictures/Buttons/Battery Pics/series.png"
            }
            else if(text1 == parallel){
                battPage.source= "UIPictures/Buttons/Battery Pics/Parallel.png"
            }
            else if(text1 == electric){
                battPage.source= "UIPictures/Buttons/Battery Pics/electric.png"
            }
            else battPage.source="UIPictures/Buttons/Battery Pics/normalbattery.png"
            }
        }*/

    //Battery Charge
    Rectangle {
        id: battChargeRect
        color: "green";
        width: 90
        height: 225
        x: 34
        y: 118
        border.color: "white";
        border.width: 0;
        radius: 8
    }
    Text {
        id: text3
        x: 42
        y: 140
        width: 79
        height: 42
        text: qsTr("100")
        font.pixelSize: 30
        Timer{
            id: battChargeTimer
            interval: 1000;
            running: true;
            repeat: true;
            onTriggered: {
                if(text3.text<= 40 && text3.text >= 20){
                    battChargeRect.color="yellow";
                }
                else if(text3.text < 20){
                    battChargeRect.color="red";
                }
            }
        }
    }

    //Battery Rate
    Rectangle {
        id: battRateRect
        color: "green"
        width: 90
        height: 225
        x: 280
        y: 118
        border.color: "white";
        border.width: 0;
        radius: 8
        rotation: 0
    }

    Text {
        id: text4
        x: 288
        y: 140
        width: 79
        height: 42
        text: qsTr("100%")
        //horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 30
        Timer{
            id: battRateTimer
            interval: 1000;
            running: true;
            repeat: true;
            onTriggered: {
                if(text4 <= 40 && text4 >= 20){
                    battRateRect.color="yellow";
                }
                else if(text4 < 20){
                    battRateRect.color="red";
                }
            }
        }
    }

    //Battery Temp
    Rectangle {
        id: rectangle1
        x:160
        y: 117
        width: 90
        height: 227
        border.width: 0;
        radius: 8
        rotation: 0
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#d54545"
            }

            GradientStop {
                position: 1
                color: "#7c79e6"
            }
        }
    }
    Rectangle {
        id: rectangle1Top
        x:160
        y:200
        z: 3
        width: 90
        height: 5
        color: "#000066"
    }

    Text{
        id: textTimer
        x: 170
        y: 0
        z: 1
        width: 79
        height: 42
        text: timerValue
        color: "white"
        font.pixelSize: 30
        Timer{
            id: testTimer
            interval: 1000;
            running: true;
            repeat: true;
            onTriggered: {
                timerValue = timerValue + 1;
            }
        }
    }

    Text {
        id: text2
        x: 170
        y: 215
        width: 79
        height: 42
        text: currentTemp
        font.pixelSize: 30
        /*Timer{
            id: battTempTimer
            interval: 1000;
            running: true;
            repeat: true;
            onTriggered: {
                currentTemp = bett_temp;
                if(currentTemp < ){ //highest:130  lowest:300
                    text2.y= 215+((currentTemp-battTempOffset)/175);
                    battTempOffset = currentTemp;
                }
                else if(currentTmep > battTempOffset){
                    text2.y= 215-((currentTemp-battTempOffset)/175);
                    battTempOffset = currentTemp;
                }
            }
        }*/
    }

    //Testing Batt Temp
    MouseArea{
        id: mouse1
        x: 0
        y: 0
        width: 100
        height: 100
        onClicked: {
            currentTemp = currentTemp - 3;
            if(currentTemp < battTempOffset){ //COLD  highest:130  lowest:300
                if(currentTemp < 100 ) {
                    text2.y= 215 - ((currentTemp-battTempOffset));
                    rectangle1Top.y = text2.y;
                    //battTempOffset = currentTemp;
                }
                text2.text = currentTemp;
            }
            else if(currentTemp > battTempOffset){ //HOT
                if(currentTemp > 0) {
                    text2.y= 215 - ((currentTemp-battTempOffset));
                    rectangle1Top.y = text2.y;
                   // battTempOffset = currentTemp;
                }
                text2.text = currentTemp;
            }
        }
    }

    MouseArea{
        id: mouse2
        x: 100
        y: 0
        width: 100
        height: 100
        onClicked: {
            currentTemp = currentTemp + 3;
            if(currentTemp < battTempOffset){ //COLD  highest:130  lowest:300
                if(currentTemp < 100) {text2.y= 215 - ((currentTemp-battTempOffset));}
                text2.text = currentTemp;
                rectangle1Top.y = text2.y;
            }
            else if(currentTemp > battTempOffset){ //HOT
                if(currentTemp > 0) {text2.y= 215 - ((currentTemp-battTempOffset));}
                text2.text = currentTemp;
                rectangle1Top.y = text2.y;
            }
        }
    }

    //TEsting battery rate
    MouseArea{
        id: mouse3
        x: 200
        y: 0
        width: 100
        height: 100
        onClicked: {
            if(text3.text > 0)
                text3.text = text3.text-10;

            if(text3.text<= 40 && text3.text >= 20){
                battChargeRect.color="yellow";
            }
            else if(text3.text < 20){
                battChargeRect.color="red";
            }
        }
    }
}
