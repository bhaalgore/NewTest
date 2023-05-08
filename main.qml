import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15
import "ui/ControlPanel"
import "ui/BottomScreen"
import "ui/Notification"

ApplicationWindow {
    id: mainWindow
    flags: Qt.FramelessWindowHint | Qt.Window
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

        // Left field
        Rectangle {
            id: textColumn
            color: "#272930"
            opacity: 0.9
            width: 216

            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: pageColumn.left

            Image {
                id: micranLogo
                source: "ui/assets/micran-logo.png"
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

            Rectangle {
                id: rec
                width: 200
                height: 160
                anchors.centerIn: parent

                ColumnLayout {

                    // Main
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

                    // Archive
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

                    // Advice
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

                    // Settings
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

        // Right field
        Rectangle {
            id: pageColumn
            anchors.left: textColumn.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right:parent.right
            color: "#1E1E1E"
            width: mainWindow.width - textColumn.width
            Loader {
                    id: pageLoader
                    source: ""
                    anchors.fill: parent
                }
        }
    }
}
