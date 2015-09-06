import QtQuick 2.0

Rectangle {
    id: checkerboard
    color: "black"
    width: mainWindow.mediumSize*mainWindow.sizeFactor
    height: width

    Rectangle { id: rect1
        color: "white"
        width: checkerboard.width/2
        height: width }

    Rectangle { id: rect2;
        color: "white"
        width: checkerboard.width/2
        height: width
        anchors.left: rect1.right
        anchors.top: rect1.bottom }

    MouseArea {
        anchors.fill: parent
        drag.target: checkerboard
        drag.axis: Drag.XandYAxis
        drag.minimumX: 0
        drag.maximumX: mainWindow.width - checkerboard.width
        drag.minimumY: 0
        drag.maximumY: mainWindow.height - checkerboard.height
    }

}
