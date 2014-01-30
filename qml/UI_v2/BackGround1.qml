import QtQuick 1.0

Rectangle{
    id: backGroundPage
        x: 0
        y: 0
        z: 2
        height: 0
        width: 800
Image {
    id: docPicture
    x: 0
    y: 0
    z: 1
    width: 800
    height: 98
    //anchors.top: battPage.bottom
  //  anchors.topMargin: -123
    fillMode: Image.PreserveAspectFit
    signal energyButtonClicked
    signal radioButtonClicked
    signal acButtonClicked
    signal batteryButtonClicked
    source: "UIPictures/Home Screens/bar.png"
    opacity: 1
    }

}
