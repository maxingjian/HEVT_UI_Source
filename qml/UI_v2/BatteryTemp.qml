import QtQuick 1.0

Image{
    Connections{
        target: CanControl
        onVeh_mode_recieved:{
            text1 = veh_mode;
        }
        onBatt_temp_recieved:{
            text2.text = bett_temp;
            currentTemp = bett_temp;
        }
        onBatt_soc_recieved:{
            text3.text = batt_soc;
        }
        onBatt_current_recieved:{
            text4.text = batt_current;
            CanControl.recieve_nb("1638")
        }

        }
    Timer{
        id: startUpTimer
        interval: 500;
        running: true;
        repeat: false;
        onTriggered:{
            CanControl.recieve_nb("1638")
        }
    }

    id: battPage
    x: 0
    y: 0
    z: -1
    opacity: 1
    scale: 1
    source:"UIPictures/Home Screens/normalbattery.png"
    property string modeTimer
    property string battChargeTimer
    property string battRateTimer
    property string battTempTimer
    property string text1
    property int currentTemp: 40
    property int battTempOffset: 40
    property int colorConversion: 0
    property int battColor: 0xD000D0
//    property int timerCount: 0

    Image{
        id: modePicture
        x: 520
        y: 25
       // width: 0
        //height: 0
        z: 1
    }

    //Repeats every second to see if the mode has changed
    Timer{
        id: modeTimer
        interval: 1000;
        running: true;
        repeat: true;
        onTriggered: {
            if(text1 == "SERIES"){
                modePicture.source= "UIPictures/Buttons/Battery Pics/series.png"
                modePicture.opacity = 1
            }
            else if(text1 == "PARALLEL"){
                modePicture.source= "UIPictures/Buttons/Battery Pics/Parallel.png"
                modePicture.opacity = 1
            }
            else if(text1 == "ELECTRIC"){
                modePicture.source= "UIPictures/Buttons/Battery Pics/electric.png"
                modePicture.opacity = 1
            }
            else modePicture.opacity = 0
            }
        }

    //Battery Charge
    Rectangle {
        id: battChargeRect
        color: "green";
        width: 90
        height: 225
        x: 34
        y: 118
        z: 3
        border.color: "white";
        border.width: 0;
        radius: 8
    }
//    Text {
//        id: timerCounter
//        x: 0
//        y: 400
//        z: 4
//        width: 50
//        height: 50
//        color: "white"
//        text: timerCount
//    }

    Text {
        id: text3
        x: 42
        y: 140
        z: 3
        width: 79
        height: 42
        text: qsTr("100")
        color: "white"
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

    Text{
        id: socSign
        x: 100
        y: 142
        z: 3
        width: 10
        height: 42
        color: "white"
        text: "%"
        font.pixelSize: 28
    }


    //Battery Rate
    Rectangle {
        id: battRateRect
        color: "green"
        width: 90
        height: 225
        x: 280
        y: 118
        z: 3
        border.color: "white";
        border.width: 0;
        radius: 8
        rotation: 0
    }

    Text {
        id: text4
        x: 286
        y: 140
        z: 3
        width: 79
        height: 42
        color: "white"
        text: qsTr("100")
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

    Text{
        id: currentUnits
        x: 347
        y: 142
        z: 3
        width: 10
        height: 42
        color: "white"
        text: "A"
        font.pixelSize: 28
    }

    Rectangle{
        id: tempCoverage
        x: 160
        y: 117
        z: 2
        width: 90
        height: 154.36 - 1.816*currentTemp
        color: "gray"
        opacity: 0.75
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
        color: "#"+AC_Controls.convert(battColor)
    }

    Text {
        id: tempUnits
        x: 213
        y: 140
        z: 4
        width: 20
        height: 42
        color: "white"
        text: '\xB0' + "C"
        font.pixelSize: 30
    }

    Text {
        id: text2
        x: 165
        y: 140
        z: 3
        width: 79
        height: 42
        text: currentTemp
        color: "white"
        font.pixelSize: 30
        Timer{
            id: battTempTimer
            interval: 1000;
            running: true;
            repeat: true;
            onTriggered: {
//                timerCount = timerCount + 1;
//                currentTemp = bett_temp;
//                text2.text = currentTemp;
                if (currentTemp < 42){ // This will be making it more blue
                    colorConversion = currentTemp + battTempOffset;
                    colorConversion = colorConversion/4.4286;
                    battColor = 0x0000D0;
                    while (colorConversion > 1){
                        battColor = battColor + 0x100000;
                        colorConversion = colorConversion - 1;
                    }
                    rectangle1.color = "#"+AC_Controls.convert(battColor);
                }
                else if (currentTemp > 42){ // This will be making it more red
                    //battColor = 0xD00000;
                    colorConversion = currentTemp + battTempOffset;
                    colorConversion = colorConversion/4.4286;
                    battColor = 0xD00000;
                    while(colorConversion < 32){
                        battColor = battColor + 0x000010;
                        colorConversion = colorConversion + 1;
                    }
                    rectangle1.color = "#"+AC_Controls.convert(battColor);
                }
                else // 23deg C is purple
                    rectangle1.color = "#D000D0";
            }
        }
    }

    //Testing Batt Temp
    /*MouseArea{
        id: mouse1
        x: 0
        y: 0
        width: 100
        height: 100
        onClicked: {
            currentTemp = currentTemp - 3;
            if (currentTemp < -40)
                currentTemp = -40;
            else if (currentTemp > 85)
                currentTemp = 85;
            text2.text = currentTemp;
            if (currentTemp < 42){ // This will be making it more blue
                colorConversion = currentTemp + battTempOffset;
                colorConversion = colorConversion/4.4286;
                battColor = 0x0000D0;
                while (colorConversion > 1){
                    battColor = battColor + 0x100000;
                    colorConversion = colorConversion - 1;
                }
                rectangle1.color = "#"+AC_Controls.convert(battColor);
            }
            else if (currentTemp > 42){ // This will be making it more red
                colorConversion = currentTemp + battTempOffset;
                colorConversion = colorConversion/4.4286;
                battColor = 0xD00000;
                while(colorConversion < 32){
                    battColor = battColor + 0x000010;
                    colorConversion = colorConversion + 1;
                }
                rectangle1.color = "#"+AC_Controls.convert(battColor);
            }
            else // 23deg C is purple
                rectangle1.color = "#D000D0";
        }
    }*/

    /*MouseArea{
        id: mouse2
        x: 100
        y: 0
        width: 100
        height: 100
        onClicked: {
            currentTemp = currentTemp + 3;
            if (currentTemp < -40)
                currentTemp = -40;
            else if (currentTemp > 85)
                currentTemp = 85;
            text2.text = currentTemp;
            if (currentTemp < 42){ // This will be making it more blue
                colorConversion = currentTemp + battTempOffset;
                colorConversion = colorConversion/4.4286;
                battColor = 0x0000D0;
                while (colorConversion > 1){
                    battColor = battColor + 0x100000;
                    colorConversion = colorConversion - 1;
                }
                rectangle1.color = "#"+AC_Controls.convert(battColor);
            }
            else if (currentTemp > 42){ // This will be making it more red
                colorConversion = currentTemp + battTempOffset;
                colorConversion = colorConversion/4.4286;
                battColor = 0xD00000;
                while(colorConversion < 32){
                    battColor = battColor + 0x000010;
                    colorConversion = colorConversion + 1;
                }
                rectangle1.color = "#"+AC_Controls.convert(battColor);
            }
            else // 43deg C is purple
                rectangle1.color = "#D000D0";
        }
    }*/
}
