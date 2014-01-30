import QtQuick 1.0


/* FanLevel.qml Information
    FanLevel - Controlls the fan level graphics. When the fan level is increased the next fan level bar is made visible and when decreased
               the highest bar visible is hidden. The fan level is controlled by the two signals fanLevelIncrease and fanLevelDecrease. The
               Fan Level pictures include 5 separate images, for off, levels 1-5. Updates fanLevel function in AC_Controls.h with the
               current fan level

    Interacts with - this file and its signals/variables interact with
                        1) POC_Layout.qml
                        2) AC_Controls.h
*/

Rectangle { id: fanLevel; width: 144; height: 34; color: "#00000000"

             //Variables used in FanLevel
            property int currentFanLevel        //Holds the current fan level state
            signal fanLevelIncrease             //Command to raise the fan level
            signal fanLevelDecrease             //Command to lower the fan level

            //Renamed properties. similair to #define in C. e.x. fan1 can be used in place of fanLevel1.opacity to control the opacity value
            property alias fan1: fanLevel1.opacity
            property alias fan2: fanLevel2.opacity
            property alias fan3: fanLevel3.opacity
            property alias fan4: fanLevel4.opacity
            property alias fan5: fanLevel5.opacity

    // Pictures from FanOff to FanLevel5 ( Displays/Hides the Fan Level segments as the fan is increased/decreased
        Image { id: fanLevelOff; anchors.fill: parent; source: "UIPictures/vent3.png" }

        Image { id: fanLevel1; x: 0; y: 0; opacity: 0; visible: true; anchors.fill: parent; source: "UIPictures/vent1.png" }

        Image { id: fanLevel2; x: 0; y: 0; opacity: 0; visible: true; source: "UIPictures/vent2.png" }

        Image { id: fanLevel3; x: 0; y: 0; opacity: 0; visible: true; source: "UIPictures/vent3.png" }

        Image { id: fanLevel4; x: 0; y: 0; opacity: 0; visible: true; source: "UIPictures/vent4.png" }

        Image { id: fanLevel5; x: 0; y: 0; opacity: 0; visible: true; source: "UIPictures/vent5.png" }

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
