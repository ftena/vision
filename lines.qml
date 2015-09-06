import QtQuick 2.0

Rectangle {
    id: lines
    color: "black"
    width: (mainWindow.mediumSize*mainWindow.sizeFactor)*2
    height: (width/2-100)*2
    onColorChanged: changeLinesColor(color)

    Row {
        Repeater {
            id: rowOfLines
            model: 5
            Rectangle {
                width: lines.width/5
                height: lines.height
                border.width: 10
                border.color: "white"
                color: "black"
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        drag.target: lines
        drag.axis: Drag.XandYAxis
        drag.minimumX: 0
        drag.maximumX: mainWindow.width - lines.width
        drag.minimumY: 0
        drag.maximumY: mainWindow.height - lines.height
    }

    function changeLinesColor(color) {
        for (var i = 0; i < rowOfLines.count; i++)
            rowOfLines.itemAt(i).color = color
    }

}
