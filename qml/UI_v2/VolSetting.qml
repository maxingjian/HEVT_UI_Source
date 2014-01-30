import QtQuick 1.1
Image{
    id: volSetting
    x: 0
    y: 0
    source:"UIPictures/volSetting.png"
    //initialize variables
    property int bassLevel
    property int trebleLevel
    property int balanceLevel
    property int fadeLevel
    property string busMessage
    property string keypressed
//    function volumeDisplay(){
//        if(volumeLevel<=0){
//            bass1.opacity =0
//            bass2.opacity =0
//            bass3.opacity =0
//            bass4.opacity =0
//            bass5.opacity =0
//        }
//        else if(volumeLevel>0 && volumeLevel<=0x33){
//            bass1.opacity =1
//            bass2.opacity =0
//            bass3.opacity =0
//            bass4.opacity =0
//            bass5.opacity =0
//        }

//        else if(volumeLevel>0x33 && volumeLevel<=0x66){
//            bass1.opacity =0
//            bass2.opacity =1
//            bass3.opacity =0
//            bass4.opacity =0
//            bass5.opacity =0
//        }
//        else if(volumeLevel>0x66 && volumeLevel<=0x99){
//            bass1.opacity =0
//            bass2.opacity =0
//            bass3.opacity =1
//            bass4.opacity =0
//            bass5.opacity =0
//        }
//        else if(volumeLevel>0x99 && volumeLevel<=0xCC){
//            bass1.opacity =0
//            bass2.opacity =0
//            bass3.opacity =0
//            bass4.opacity =1
//            bass5.opacity =0
//        }
//        else if(volumeLevel>0xCC && volumeLevel<=0xFF){
//            bass1.opacity =0
//            bass2.opacity =0
//            bass3.opacity =0
//            bass4.opacity =0
//            bass5.opacity =1
//        }
//    }
    //this code is written for drag inside of the car image, mainly taking care of the
    //fade and balance sound control in the vehicle.
    Image{
        id: ball
        x:261
        y:71
        //x: 430
        //y: 66
        opacity: 1
        source:"UIPictures/ball.png"
        MouseArea{
            id:fadeBalance
            x: 0
            y: 0
            width: 172
            height: 166
            drag.target:parent
            drag.axis:Drag.XandYAxis
        }
        onXChanged: {
//            if (fadeBalance.drag.active) {
//                console.log("x=" + x)
//            }
            //these code is to make sure that the x axis does not get outside of the outline of
            //the car in the x axis
            if(x<265){
                x = 265
            }
            if(x>594){
                x = 594
            }
            fadeLevel =(x-265)*255/329;
//            console.log("fade = " +fadeLevel);
            busMessage = "0x244 0x07 0xAE 0X03 0X0 0X0 0X80 "+fadeLevel+" 0X0"        // Create CAN message
            keypressed = "fade"  // Debug Message
            RadioUnit.radioBus(busMessage, keypressed) // Send CAN message onto bus
        }
        onYChanged: {
//            if (fadeBalance.drag.active) {
//              console.log("y=" + y)
//            }
            //these code is to make sure that the y axis does not get outside of the outline of
            //the car in the y axis
            if(y<44){
                y = 44
            }
            if(y>103){
                y=103
            }
            balanceLevel = (103-y)*255/59;
//            console.log("balance = " +balanceLevel);
            busMessage = "0x244 0x07 0xAE 0X03 0X0 0X0 0X40 0X0 "+balanceLevel        // Create CAN message
            keypressed = "Balance"  // Debug Message
            RadioUnit.radioBus(busMessage, keypressed) // Send CAN message onto bus
        }
    }
    //this is used for bass
        Rectangle {
            id: container
            x: 127
            y: 114
            width: 20; height: 120
            color: "transparent"
            rotation: 180
            Rectangle{
                id: rect1
                y: 0
                width:20;height: 60
                color:"deepskyblue"
            }
            Rectangle {
                id: rect
                y:60
                width: 20; height: 10
                color: "dodgerblue"
                MouseArea {
                    id: rectMouse
                    width: 30
                    height: 30
                    //anchors.fill: parent
                    drag.target: rect
                    drag.axis: Drag.YAxis
                    drag.minimumY: 0
                    drag.maximumY: container.height-rect.height
                }
                onYChanged: {
                    rect1.height = y;
                    //console.log("height = "+ y)
                    bassLevel = y/110*255
                    //console.log("basslevel = "+bassLevel)
                    busMessage = "0x244 0x07 0xAE 0X04 0X80 "+bassLevel+" 0X0 0X0 0x0"        // Create CAN message
                    keypressed = "bass"  // Debug Message
                    RadioUnit.radioBus(busMessage, keypressed) // Send CAN message onto bus
                }
            }
        }
        //this container is used for treble
        Rectangle {
            id: trebleContainer
            x: 196
            y: 114
            width: 20; height: 120
            color: "transparent"
            rotation: 180
            Rectangle{
                id: rect2
                y: 0
                width:20;height: 60
                color:"deepskyblue"
            }
            Rectangle {
                id: rect3
                y:60
                width: 20; height: 10
                color: "dodgerblue"
                MouseArea {
                    id: rectMouse2
                    width: 30
                    height: 30
                    //anchors.fill: parent
                    drag.target: rect3
                    drag.axis: Drag.YAxis
                    drag.minimumY: 0
                    drag.maximumY: trebleContainer.height-rect3.height
                }
                onYChanged: {
                    rect2.height = y;
                    console.log("treble = "+ y)
                    trebleLevel = y/110*255
                    //console.log("basslevel = "+bassLevel)
                    busMessage = "0x244 0x07 0xAE 0X04 0X20 0x0 0x0 "+trebleLevel+" 0X0"        // Create CAN message
                    keypressed = "treble"  // Debug Message
                    RadioUnit.radioBus(busMessage, keypressed) // Send CAN message onto bus
                }
            }
        }
}
    /*
    Image{
        id: bass1
        x: 95
        y: 76
        width: 83
        height: 173
        opacity: 1
        source:"UIPictures/vol1.png"
    }*/
    /*
    Image{
        id: bass2
        x: 95
        y: 76
        width: 83
        height: 173
        opacity: 1
        source:"UIPictures/vol2.png"
    }
    Image{
        id: bass3
        x: 95
        y: 76
        width: 83
        height: 173
        opacity: 1
        source:"UIPictures/vol3.png"
    }
    Image{
        id: bass4
        x: 95
        y: 76
        width: 83
        height: 173
        opacity: 1
        source:"UIPictures/vol4.png"
    }
    Image{
        id: bass5
        x: 95
        y: 76
        width: 83
        height: 173
        opacity: 1
        source:"UIPictures/vol5.png"
    }
    Image{
        id: treble1
        x: 165
        y: 76
        width: 83
        height: 173
        opacity: 1
        source:"UIPictures/vol1.png"
    }
    Image{
        id: treble2
        x: 165
        y: 76
        width: 83
        height: 173
        opacity: 1
        source:"UIPictures/vol2.png"
    }
    Image{
        id: treble3
        x: 165
        y: 76
        width: 83
        height: 173
        opacity: 1
        source:"UIPictures/vol3.png"
    }
    Image{
        id: treble4
        x: 165
        y: 76
        width: 83
        height: 173
        opacity: 1
        source:"UIPictures/vol4.png"
    }
    Image{
        id: treble5
        x: 165
        y: 76
        width: 83
        height: 173
        opacity: 1
        source:"UIPictures/vol5.png"
    }
    MouseArea{
        id: bassDown
    }
    MouseArea{
        id: bassUp
    }
    //creat a slider.
        Rectangle {
            id: container
            x: 127
            y: 114
            width: 10; height: 123
            color: "transparent"
            rotation: 180
            Rectangle{
                id: rect1
                x: 0
                width:0;height: 10
                color:"deepskyblue"
            }
            Rectangle {
                id: rect
                x: 0
                width: 10; height: 10
                color: "deepskyblue"
                MouseArea {
                    anchors.fill: parent
                    drag.target: rect
                    drag.axis: Drag.XAxis
                    drag.minimumX: 0
                    drag.maximumX: container.width - rect.width
                }
                onXChanged: {
                    rect1.width = x;
                    //container.width = x;
                   // rect.width = container.width - x;
                }

//                Text {
//                    id : te
//                    x: -20
//                    y: 18
//                    color: "olivedrab"
//                    text: "Range"
//                }
            }
        }
*/
//}
