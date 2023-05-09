import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15
import QtQml.Models 2.15
import "ui/ControlPanel"
import "ui/BottomScreen"
import "ui/Notification"
import "ui/LeftArea"
ApplicationWindow {
    id: mainWindow
    //flags: Qt.FramelessWindowHint | Qt.Window
    width: 900
    height: 600

    minimumWidth: width
    minimumHeight: height
    maximumWidth: width
    maximumHeight: height

    visible: true
    color: "transparent"

    Rectangle {
        width: mainWindow.width
        height: mainWindow.height
        color: "transparent"

        LeftArea{
            id: leftField
        }

        // Right field
        Rectangle {
            id: rightField
            anchors.left: leftField.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right:parent.right
            color: "#1E1E1E"
            width: mainWindow.width - leftField.width
            Loader {
                    id: rightFieldLoader
                    source: "qrc:/ui/Notification/MyPage.qml"
                    anchors.fill: parent
                }
        }
    }
}
