import QtQuick 1.0

Rectangle{
    id: backGroundPage
        x: 0
        y: 0
        z: 0
        height: 105
        width: 800
Image {
    id: docPicture
    x: 0
    y: 0
    z: 0
    width: 800
    height: 105
    //anchors.top: battPage.bottom
    anchors.topMargin: -123
    fillMode: Image.PreserveAspectFit
    signal energyButtonClicked
    signal radioButtonClicked
    signal acButtonClicked
    signal batteryButtonClicked
    source: "UIPictures/dockPage.png"
    opacity: 1
    }
}
