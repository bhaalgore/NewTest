import QtQuick 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id:wrapper
    anchors.top: parent.top
    width: mainWindow.width - leftField.width
    height: 40
    color: "transparent"
    Item {
        id: dragHandler
        anchors.fill: parent
        DragHandler {
            acceptedDevices: PointerDevice.GenericPointer
            grabPermissions:  PointerHandler.CanTakeOverFromItems | PointerHandler.CanTakeOverFromHandlersOfDifferentType | PointerHandler.ApprovesTakeOverByAnything
            onActiveChanged: if (active) mainWindow.startSystemMove()
        }
        }
    RowLayout {
        anchors.top:parent.top
        anchors.right: parent.right

        Rectangle {
            id: recMinimizeWrapper
            Layout.preferredWidth:  25
            Layout.preferredHeight:  25
            color:"transparent"
            Image {
                id: minimizeImage
                source: "qrc:/ui/assets/minimizeIcon.svg"
                Layout.preferredWidth:  18
                Layout.preferredHeight:  2
                anchors.centerIn: recMinimizeWrapper
            }
            MouseArea {
                anchors.fill: recMinimizeWrapper
                hoverEnabled: true
                onEntered: {
                    recMinimizeWrapper.color = "#E5E5E5"
                    recMinimizeWrapper.opacity = 0.5
                }
                onExited: {
                    recMinimizeWrapper.color = "transparent"
                }
                onClicked: {
                    mainWindow.showMinimized()
                }
            }
        }

        Rectangle {
            id: recQuitWrapper
            Layout.preferredWidth:  25
            Layout.preferredHeight:  25
            color:"transparent"
            Image {
                id: closeImage
                source: "qrc:/ui/assets/Vector.svg"
                Layout.preferredWidth:  16
                Layout.preferredHeight:  15
                anchors.centerIn: recQuitWrapper
                MouseArea {
                    hoverEnabled: true
                    onEntered: {
                        recQuitWrapper.color = "#E5E5E5"
                        recQuitWrapper.opacity = 0.5
                    }
                    onExited: {
                        recQuitWrapper.color = "transparent"
                    }

                    anchors.fill: parent
                    onClicked: {
                        Qt.quit();
                    }
                }
            }
        }
    }
}
