import QtQuick 2.3
import QtQuick.Dialogs

MessageDialog {
    id: info
    title: qsTr("Info")
    text: qsTr("The purpose of this application is to train the eyes of your baby.\n
The idea is to show the figures and pictures in order and letting your baby \
begins to look at them. You should move slowly the device from left to \
right, upward, downward and so forth.\n
This simple task is very important to improve the vision in babies so \
they have a better sense of depth, movement and colors.\n
The application is specially designed to be used from 0 to 3-4 months. \n
More info @ tarod.net")

    onAccepted: {
        Qt.close
    }

    Component.onCompleted: visible = true
}
