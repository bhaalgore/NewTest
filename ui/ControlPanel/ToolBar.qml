import QtQuick 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id:wrapper
    anchors.top: parent.top
    width: mainWindow.width - leftField.width
    height: 40
    color: "transparent"
    Item {
        id: _dragHandler
        anchors.fill: parent
        DragHandler {
            acceptedDevices: PointerDevice.GenericPointer
            grabPermissions:  PointerHandler.CanTakeOverFromItems | PointerHandler.CanTakeOverFromHandlersOfDifferentType | PointerHandler.ApprovesTakeOverByAnything
            onActiveChanged: if (active) mainWindow.startSystemMove()
        }
        }
    RowLayout {
        spacing: 17
        anchors.top:parent.top
        anchors.right: parent.right
        Rectangle {
            id: rec
            Layout.preferredWidth:  18
            Layout.preferredHeight:  18
            color:"transparent"
            Image {
                id: minimizeImage
                source: "qrc:/ui/assets/minimizeIcon.svg"
                Layout.preferredWidth:  18
                Layout.preferredHeight:  2
                anchors.centerIn: rec
            }
            MouseArea {
                anchors.fill: rec
                onClicked: {
                    mainWindow.showMinimized()
                }
            }
        }

        Image {
            id: closeImage
            source: "qrc:/ui/assets/Vector.svg"
            Layout.preferredWidth:  16
            Layout.preferredHeight:  15
            Layout.margins: 15
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    Qt.quit();
                }
            }
        }
    }
}
