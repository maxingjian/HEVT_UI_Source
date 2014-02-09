import QtQuick 1.1
Image{
    id: volSetting
    x: 0
    y: 0
    source:"UIPictures/Home Screens/volumesettings.png"
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
        x:576
        y:185
        width: 110
        height: 110
        sourceSize.height: 170
        sourceSize.width: 170
        //x: 430
        //y: 66
        opacity: 1
        source:"UIPictures/Buttons/Volume Setting Buttons/volume_ball.png"
        MouseArea{
            id:fadeBalance
            x: 0
            y: 0
            width: 110
            height: 110
            drag.target:parent
            drag.axis:Drag.XandYAxis
        }
        onXChanged: {
//            if (fadeBalance.drag.active) {
//                console.log("x=" + x)
//            }
            //these code is to make sure that the x axis does not get outside of the outline of
            //the car in the x axis
            if(x<548){
                x = 548
            }
            if(x>600){
                x = 600
            }
            fadeLevel =(x-548)*255/52;
//            console.log("fade = " +fadeLevel);
            busMessage = "0x244 0x07 0xAE 0X03 0X0 0X0 0X80 0x"+AC_Controls.convert(fadeLevel)+" 0X0"        // Create CAN message
            keypressed = "fade"  // Debug Message
            RadioUnit.radioBus(busMessage, keypressed) // Send CAN message onto bus
        }
        onYChanged: {
//            if (fadeBalance.drag.active) {
//              console.log("y=" + y)
//            }
            //these code is to make sure that the y axis does not get outside of the outline of
            //the car in the y axis
            if(y<77){
                y = 77
            }
            if(y>300){
                y=300
            }
            balanceLevel = (300-y)*255/223;
//            console.log("balance = " +balanceLevel);
            busMessage = "0x244 0x07 0xAE 0X03 0X0 0X0 0X40 0X0 0x"+AC_Controls.convert(balanceLevel)        // Create CAN message
            keypressed = "Balance"  // Debug Message
            RadioUnit.radioBus(busMessage, keypressed) // Send CAN message onto bus
        }
    }
    //this is used for bass
        Rectangle {
            id: container
            x: 159
            y: 164
            width: 227; height: 20
            color: "transparent"
            //rotation: 180
            Rectangle{
                id: rect1
                x: 0
                y: 8
                width:60; height:2
                color:"#987098"
            }
            Image {
                id: rect
                x:60
                y: 0
                source: "UIPictures/Buttons/Volume Setting Buttons/bass_treble.png"
                MouseArea {
                    id: rectMouse
                    width: 30
                    height: 30
                    //anchors.fill: parent
                    drag.target: rect
                    drag.axis: Drag.XAxis
                    drag.minimumX: 0
                    drag.maximumX: container.width-rect.width
                }
                onXChanged: {
                    rect1.width = x;
                    //console.log("height = "+ x/(container.width-rect.width))
                    bassLevel = x/(container.width-rect.width)*255
                    //console.log("basslevel = "+bassLevel)
                    busMessage = "0x244 0x07 0xAE 0X04 0X80 0x"+AC_Controls.convert(bassLevel)+" 0X0 0X0 0x0"        // Create CAN message
                    keypressed = "bass"  // Debug Message
                    RadioUnit.radioBus(busMessage, keypressed) // Send CAN message onto bus
                }
            }
        }
        //this container is used for treble
        Rectangle {
            id: trebleContainer
            x: 159
            y: 279
            width:227; height:20
            color: "transparent"
            //rotation: 180
            Rectangle{
                id: rect2
                x: 0
                y: 8
                width:60; height:2
                color:"#987098"
            }
            Image {
                id: rect3
                x:60
                source: "UIPictures/Buttons/Volume Setting Buttons/bass_treble.png"
                MouseArea {
                    id: rectMouse2
                    width: 30
                    height: 30
                    //anchors.fill: parent
                    drag.target: rect3
                    drag.axis: Drag.XAxis
                    drag.minimumX: 0
                    drag.maximumX: trebleContainer.width-rect3.width
                }
                onXChanged: {
                    rect2.width = x;
                    //console.log("treble = "+ x)
                    trebleLevel = x/(trebleContainer.width-rect3.width)*255
                    //console.log("basslevel = "+AC_Controls.convert(trebleLevel))
                    busMessage = "0x244 0x07 0xAE 0X04 0X20 0x0 0x0 0x"+AC_Controls.convert(trebleLevel)+" 0X0"        // Create CAN message
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
