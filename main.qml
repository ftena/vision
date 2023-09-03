/*
  * Notes:
  *     Access to items inside a Loader: xLoader.children[0].width)
  */

/*
    Throughout our documentation and examples, QML object attributes are always
    structured in the following order:

    id
    property declarations
    signal declarations
    JavaScript functions
    object properties
    child objects
    states
    transitions
*/

import QtQuick 2.3
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.1

ApplicationWindow {
    id: mainWindow

    /*
      * It stores the size factor, used to change the size of the
      * different figures.
      */
    property double sizeFactor: 0.6

    /* Maximum and minimum width allowed */
    property int maximumFigureWidth: 600
    property int minimumFigureWidth: 50;

    /*
      * It stores the medium size for the different figures.
      */
    property int mediumSize: 400
    /*
      * TODO: Could this be improved?
      * When a button is pushed, the window is resized to the figures's size
      * so we need to store the previous height and change the window's height
      * again after painting the figures.
      * The previousHeight will be at the beginning the same as the
      * screen height.
      */
    property int previousHeight
    /*
      * This property is only used for now by the figure 'lines'.
      */
    property int previousWidth

    /* Javascript functions */

    function resize(item, action) {
        if (action === 0)
        {
            if ( item.width + 50 <= maximumFigureWidth )
            {
            item.width = item.width + 50;
            }
        }
        else
        {
            if ( item.width - 50 >= minimumFigureWidth )
            {
                item.width = item.width - 50;
            }
        }
    }

    /*
      * Comment width & height to resize depending on the
      * device.
      */
    //width: 640
    //height: 420

    visible: true
    /*
      * Use qsTr to get string for the *.ts file (see details in .pro)
      */
    title: qsTr("Vision Training for babies")

    menuBar: MenuBar {
        Menu {
            title: qsTr("Options")

            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }

            MenuItem {
                text: qsTr("Info")
                onTriggered: {

                    var component = Qt.createComponent("Info.qml");
                    if (component.status === Component.Ready) {
                        /*
                        * The created object will become a child of the appWindow
                        * item in main.qml.
                        */
                        var object = component.createObject(mainWindow);
                        console.log("Success loading component");
                    } else if (component.status === Component.Error) {
                        // Error Handling
                        console.log("Error loading component:", component.errorString());
                    }
                }
            }

        }
    }

    ColumnLayout{
        id: contentColumn
        width: parent.width
        Layout.preferredWidth: parent.width
        spacing: 5

        RowLayout {
            id: figuresContainer
            /* We need top alignment in order to keep the row
              below the column */
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
            Layout.leftMargin: 20
            Layout.rightMargin: 20
            spacing: 10

            PushButton {
                id: circleButton
                label: qsTr("Circle")
                onButtonClick: {
                    previousHeight = mainWindow.height
                    figureLoader.source = "circle.qml";
                    mainWindow.height = previousHeight
                }
            }


            PushButton {
                id: rectangleButton
                label: qsTr("Rectangle")
                onButtonClick: {
                    previousHeight = mainWindow.height
                    figureLoader.source = "rectangle.qml";
                    mainWindow.height = previousHeight
                }
            }

            PushButton {
                id: checkerboardButton
                label: qsTr("Checkerboard")
                onButtonClick: {
                    previousHeight = mainWindow.height
                    figureLoader.source = "checkerboard.qml";
                    mainWindow.height = previousHeight
                }

            }

            PushButton {
                id: linesButton
                label: qsTr("Lines")
                onButtonClick: {
                    previousHeight = mainWindow.height
                    previousWidth = mainWindow.width
                    figureLoader.source = "lines.qml";
                    mainWindow.height = previousHeight
                    mainWindow.width = previousWidth
                }
            }

        }

        RowLayout {
            id: resizeButtons
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
            Layout.leftMargin: 150
            Layout.rightMargin: 150
            spacing: 100

            PushButton {
                id: increaseSizeButton
                label: qsTr("+")
                onButtonClick: {
                    /*
                      Call the method to increase the size of the figure.
                    */
                    resize(figureLoader.item, 0);
                }
            }
            PushButton {
                id: decreaseSizeButton
                label: qsTr("-")
                onButtonClick: {
                    /*
                      Call the method to decrease the size of the figure.
                    */
                    resize(figureLoader.item, 1);
                }
            }
        }

        RowLayout {
            id: colorPicker
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter        
            spacing: 7        

            Cell { cellColor: "red"; onClicked: function(cellColor) {
            figureLoader.item.color = cellColor;
             }
            }
            Cell { cellColor: "green"; onClicked: figureLoader.item.color = cellColor }
            Cell { cellColor: "blue"; onClicked: figureLoader.item.color = cellColor }
            Cell { cellColor: "yellow"; onClicked: figureLoader.item.color = cellColor }
            Cell { cellColor: "steelblue"; onClicked: figureLoader.item.color = cellColor }
            Cell { cellColor: "black"; onClicked: figureLoader.item.color = cellColor }
        }

        /*
          * The loader is loaded with a qml file depending on th
          * pushbutton pushed.
          */
        Loader {
            id: figureLoader
            x: 0
            y: 0
        }
    }
}

