import QtQuick 2.3
import QtQuick.Layouts 1.3

Rectangle {
    // Identifier of the item
    id: button

    // These properties act as constants, useable outside this QML file
    property int buttonHeight: 65

    // Attaches to the Text element's text content
    property string label
    property color textColor: buttonLabel.color

    // The color highlight when the mouse hovers on the rectangle
    property color onHoverColor: "lightsteelblue"
    property color borderColor: "transparent"

    // buttonColor is set to the button's main color
    property color buttonColor: "lightblue"

    property real labelSize: 12
    // Set appearance properties
    radius: 6
    antialiasing: true
    border.width: 2
    border.color: borderColor
    height: buttonHeight
    Layout.fillWidth: true

    Text {
        id: buttonLabel
        anchors.centerIn: parent
        text: label     // Bind the text to the parent's text
        color: "black"
        font.pointSize: labelSize
    }

    // buttonClick() is callable and a signal handler,
    // onButtonClick is automatically created
    signal buttonClick()

    // Define the clickable area to be the whole rectangle
    MouseArea {
        id: buttonMouseArea
        anchors.fill: parent    // Stretch the area to the parent's dimension
        onClicked: buttonClick()

        // If true, then onEntered and onExited called if mouse hovers in the mouse area
        // If false, a button must be clicked to detect the mouse hover
        hoverEnabled: true

        // Display a border if the mouse hovers on the button mouse area
        onEntered: parent.border.color = onHoverColor
        //Remove the border if the mouse exits the button mouse area
        onExited:  parent.border.color = borderColor
    }

    // Change the color of the button when pressed
    color: buttonMouseArea.pressed ? Qt.darker(buttonColor, 1.5) : buttonColor
    // Animate the color whenever the color property changes
    Behavior on color { ColorAnimation { duration: 55 } }

    // Scale the button when pressed
    scale: buttonMouseArea.pressed ? 1.1 : 1.0
    // Animate the scale property change
    Behavior on scale { NumberAnimation { duration: 55 } }
}
