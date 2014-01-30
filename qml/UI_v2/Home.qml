
import QtQuick 1.0

Rectangle{
    id: homePage
    width: 800
    height: 480
    color: "#00000000"

    Image{
        id:homePic
        x: 0
        y: 0
        z: -1
        opacity: 1
        /*signal energyButtonClicked
        signal radioButtonClicked
        signal acButtonClicked
        signal batteryButtonClicked*/
        source: "UIPictures/Home Screens/Home.png"
    }
}

