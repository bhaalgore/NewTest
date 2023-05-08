import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "ui/ControlPanel"
import "ui/BottomScreen"
import "ui/Notification"

ApplicationWindow {
    id: mainWindow
//    flags: Qt.FramelessWindowHint
    width: 900
    height: 600
    minimumWidth: 900
    minimumHeight: 600
    visible: true
    color: "transparent"

    Rectangle {
        color: "red"
        width: mainWindow.width
        height: mainWindow.height
        radius: 10

        Rectangle {
            id: textColumn
            color: "red"
            width: mainWindow.width / 4
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right:pageColumn.left
            radius: 10
            x: width/2
            y: height/4

            Rectangle {
                id: rec
                width: 200
                height: 160
                anchors.centerIn: parent

                ColumnLayout {
                    Button {
                        Layout.preferredHeight: rec.height/4
                        Layout.preferredWidth: rec.width
                        TextArea {
                            id: textArea1
                            text: "Главная"
                            anchors.centerIn: parent
                            readOnly: true
                            selectByMouse: false
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked:
                            {
                                console.log("clicked 1")
                                pageLoader.source = "qrc:/ui/Notification/MyPage.qml"
                            }
                        }
                    }

                    Button {
                        Layout.preferredHeight: rec.height/4
                        Layout.preferredWidth: rec.width
                        TextArea {
                            id: textArea2
                            text: "Архив"
                            anchors.centerIn: parent
                            readOnly: true
                            selectByMouse: false
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked:
                            {
                                console.log("clicked 2")
                                pageLoader.source = "qrc:/ui/Notification/MyPage1.qml"
                            }
                        }
                    }

                    Button {
                        Layout.preferredHeight: rec.height/4
                        Layout.preferredWidth: rec.width
                        TextArea {
                            id: textArea3
                            text: "Советы"
                            anchors.centerIn: parent
                            readOnly: true
                            selectByMouse: false
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked:
                            {
                                console.log("clicked 3")
                                pageLoader.source = "qrc:/ui/Notification/MyPage2.qml"
                            }
                        }
                    }

                    Button {
                        Layout.preferredHeight: rec.height/4
                        Layout.preferredWidth: rec.width
                        TextArea {
                            id: textArea4
                            text: "Настройки"
                            anchors.centerIn: parent
                            readOnly: true
                            selectByMouse: false
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked:
                            {
                                console.log("clicked 4")
                                pageLoader.source = "qrc:/ui/Notification/MyPage3.qml"
                            }
                        }
                    }
                }
            }
        }

        Rectangle {
            id: pageColumn
            anchors.left: textColumn.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right:parent.right
            color: "black"
            radius: 10
            width: mainWindow.width - textColumn.width
            Loader {
                    id: pageLoader
                    source: ""
                    anchors.fill: parent
                }
        }
    }
}
