/****************************************************************************
 **
 ** Copyright (C) 2011 Nokia Corporation and/or its subsidiary(-ies).
 ** All rights reserved.
 ** Contact: Nokia Corporation (qt-info@nokia.com)
 **
 ** This file is part of the QtDeclarative module of the Qt Toolkit.
 **
 ** $QT_BEGIN_LICENSE:LGPL$
 ** GNU Lesser General Public License Usage
 ** This file may be used under the terms of the GNU Lesser General Public
 ** License version 2.1 as published by the Free Software Foundation and
 ** appearing in the file LICENSE.LGPL included in the packaging of this
 ** file. Please review the following information to ensure the GNU Lesser
 ** General Public License version 2.1 requirements will be met:
 ** http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
 **
 ** In addition, as a special exception, Nokia gives you certain additional
 ** rights. These rights are described in the Nokia Qt LGPL Exception
 ** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
 **
 ** GNU General Public License Usage
 ** Alternatively, this file may be used under the terms of the GNU General
 ** Public License version 3.0 as published by the Free Software Foundation
 ** and appearing in the file LICENSE.GPL included in the packaging of this
 ** file. Please review the following information to ensure the GNU General
 ** Public License version 3.0 requirements will be met:
 ** http://www.gnu.org/copyleft/gpl.html.
 **
 ** Other Usage
 ** Alternatively, this file may be used in accordance with the terms and
 ** conditions contained in a signed written agreement between you and Nokia.
 **
 **
 **
 **
 **
 ** $QT_END_LICENSE$
 **
 ****************************************************************************/

 import QtQuick 1.0

 Item {
     property string fanLevelString: "4"
     id: slider; width: 400
     height: {
         if(mode==1){30;}
         else {40;}
     }

     // value is read/write.
     property real value: 1
     onValueChanged: updatePos();
     property real maximum: 1
     property real minimum: 1
     property int handleX: 2
     property int handleY: 2
     property int yMax: 2
     property int xMax: width - handle.width - 4
     property string busMessage
     property string keypressed
     property string volLevel: "2"
     property int volumeLevel: 2
     onXMaxChanged: updatePos();
     onMinimumChanged: updatePos();
     property int mode: 0

     function updatePos() {
         if (maximum > minimum) {
             var pos = 2 + (value - minimum) * slider.xMax / (maximum - minimum);
             pos = Math.min(pos, width - handle.width - 2);
             pos = Math.max(pos, 2);
             handle.x = pos;
             handleX = handle.x;
             handleY = handle.y;
         } else {
             handle.x = 2;
             handleX = handle.x;
             handleY = handle.y;
         }
         yMax = mouse.drag.minimumY;
     }

     Rectangle {
         color: "#00000000"
         anchors.fill: parent
         border.color: "white"; border.width: 0; radius: 8
         rotation: 0
     }

     Rectangle {
         id: handle; smooth: true
         y: {
             if(mode == 1 || mode == 3) {3}
             else {145}
         }
         width: slider.height-4; height: slider.height-4; radius: slider.height*.5 // Makes circular object to drag
         gradient: Gradient {
             GradientStop { position: 0.0; color: "lightgray" }
             GradientStop { position: 1.0; color: "gray" }
         }

         MouseArea {
             id: mouse
             x: -8
             y: -8
             width: slider.height+12
             height: slider.height+12
             drag.target: parent
             drag.axis:{
                 if(mode == 1 || mode == 3){
                    Drag.XAxis; //Makes it only possible to drag horizontally
                 } else{
                    Drag.XandYAxis; //Can drag in x and y direction
                 }
             }
             drag.minimumX: 2;
             drag.maximumX:
                 if (mode == 1||mode == 3){slider.xMax+2;}
                 else if (mode ==2){slider.xMax-5;}
                 else {slider.xMax-15;}
             drag.minimumY:
                 if (mode == 2){169-(150*40)/(250-1.18*(handle.x+2));}
                 else {173-(150*43)/(250-1.19*(handle.x+2));}
             drag.maximumY:
                 if(mode ==2){169-(150*40)/(250-1.18*(handle.x+2));}
                 else {173-(150*43)/(250-1.19*(handle.x+2));}
             onPositionChanged: {
                 value = (maximum - minimum) * (handle.x-2) / slider.xMax + minimum;

                 if(mode==1){
                     fanLevelString = AC_Controls.convert(value)
                     AC_Controls.fanLevel(fanLevelString)
                 }else if (mode == 2){
                     //AC_Controls.acTemp(acPage.driverTemp,acPage.passengerTemp)
                     //acPage.driverTemp = (AC_Controls.convert(value))
                     AC_Controls.acTempLeft(AC_Controls.convert(value));
                 }else if (mode == 3){
                     busMessage:busMessage = "0x244 0x07 0xAE 0X01 0X40 0X0 0X0 0x"+AC_Controls.convert(value)+" 0X0"
                     RadioUnit.radioBus(busMessage, keypressed)
                     volumeLevel = value
                 }else{
                     //AC_Controls.acTemp(acPage.driverTemp,acPage.passengerTemp)
                     //acPage.passengerTemp = (AC_Controls.convert(value))
                     AC_Controls.acTempRight(AC_Controls.convert(value));
                 }
             }
         }
     }
 }
