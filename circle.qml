import QtQuick 2.0

Rectangle {
    id: circle
    color: "black"
    width: mainWindow.mediumSize*mainWindow.sizeFactor
    height: width
    radius: width

    MouseArea {
        anchors.fill: parent
        drag.target: circle
        drag.axis: Drag.XandYAxis
        drag.minimumX: 0
        drag.maximumX: mainWindow.width - circle.width
        drag.minimumY: 0
        drag.maximumY: mainWindow.height - circle.height
    }

}




