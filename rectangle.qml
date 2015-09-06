import QtQuick 2.0

Rectangle {
    id: rect
    color: "black"
    width: mainWindow.mediumSize*mainWindow.sizeFactor
    height: width

    MouseArea {
        anchors.fill: parent
        drag.target: rect
        drag.axis: Drag.XandYAxis
        drag.minimumX: 0
        drag.maximumX: mainWindow.width - rect.width
        drag.minimumY: 0
        drag.maximumY: mainWindow.height - rect.height
    }

}
