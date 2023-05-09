import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15


Rectangle {
    id: leftArea
    color: "#272930"
    opacity: 1
    width: 216
    anchors.left: parent.left
    anchors.top: parent.top
    anchors.bottom: parent.bottom
    anchors.right: rightField.left


    Image {
        id: micranLogo
        source: "qrc:/ui/assets/micran-logo.png"
        width: 24
        height: 36
        anchors {
            left: parent.left
            top: parent.top
            leftMargin: 20
            topMargin: 25
        }
    }

    Text {
        text: "Micran\nNotification Manager"
        font.pixelSize: 14
        font.family: "Arial"
        color: "#DDDDDD"
        anchors {
            left: micranLogo.right
            top: micranLogo.top
            leftMargin: 8
        }
    }

    // Menu
    Rectangle {
        id: menu
        color: "transparent"
        height: 160
        width: 194
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: micranLogo.bottom

            leftMargin: 10
            rightMargin: 10
            topMargin: 44
        }

        ColumnLayout {
            spacing: 7

            MenuMain {
                id: menuMain
            }

            MenuArchive{
                id: menuArchive
            }

            MenuAdvices {
                id: menuAdvices
            }

            MenuSettings {
                id: menuSettings
            }
        }
    }
}
