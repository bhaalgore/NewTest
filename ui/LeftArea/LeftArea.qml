import QtQuick 2.15
import QtQuick.Layouts 1.15


Rectangle {
    id: leftArea
    color: "#272930"
    opacity: 1
    width: 216
    anchors.left: parent.left
    anchors.top: parent.top
    anchors.bottom: parent.bottom
    anchors.right: rightField.left

    ColumnLayout {
        spacing: 51

        AppName {
        id: appName
        }

        // Menu
        Rectangle {
            id: menu
            color: "transparent"
            height: 160
            width: 194
            Layout.leftMargin: 10

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
}
