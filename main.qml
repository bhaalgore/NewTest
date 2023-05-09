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
            id: leftField
            color: "#272930"
//            opacity: 0.8
            width: 216

            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: rightField.left

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

            // Menu
            Rectangle {
                id: menu
                color: "transparent"
                height: 160
                width: 194
                anchors {
//                    left: parent.left
//                    right: parent.right
                    horizontalCenter: parent.horizontalCenter
                    top: micranLogo.bottom

                    leftMargin: 10
                    rightMargin: 10
                    topMargin: 44
                }

                ColumnLayout {
                    spacing: 7
                    // Main
                    Rectangle {
                        id: menuMain
                        height: 36
                        width: menu.width

                        color: (rightFieldLoader.source == "qrc:/ui/Notification/MyPage.qml") ? "#32343C" : "transparent"
                        radius: 5

                        Image {
                            id: menuMainIcon
                            source: "ui/assets/icon-home-blue.png"
                            height: 20
                            width: 20

                            anchors {
                                left: parent.left
                                verticalCenter: parent.verticalCenter

                                leftMargin: 12
                            }
                        }

                        Text {
                            id: menuMainText
                            color: "#0BBCD1"
                            text: "Главная"
                            font.pixelSize: 16
                            font.family: "Arial"
                            font.weight: Font.DemiBold
                            font.letterSpacing: 1

                            anchors {
                                left: menuMainIcon.right
                                verticalCenter: parent.verticalCenter

                                leftMargin: 14
                            }
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked:
                            {
                                console.log("Main page")
                                rightFieldLoader.source = "qrc:/ui/Notification/MyPage.qml"
                            }
                        }
                    }

                    // Archive
                    Rectangle {
                        id: menuArchive
                        height: 36
                        width: menu.width

                        color: (rightFieldLoader.source == "qrc:/ui/Notification/MyPage1.qml") ? "#32343C" : "transparent"
                        radius: 5

                        Image {
                            id: menuArchiveIcon
                            source: "ui/assets/icon-home-blue.png"
                            height: 20
                            width: 20

                            anchors {
                                left: parent.left
                                verticalCenter: parent.verticalCenter

                                leftMargin: 12
                            }
                        }

                        Text {
                            id: menuArchiveText
                            color: "#0BBCD1"
                            text: "Архив"
                            font.pixelSize: 16
                            font.family: "Arial"
                            font.weight: Font.DemiBold
                            font.letterSpacing: 1

                            anchors {
                                left: menuArchiveIcon.right
                                verticalCenter: parent.verticalCenter

                                leftMargin: 14
                            }
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked:
                            {
                                console.log("Archive Page")
                                rightFieldLoader.source = "qrc:/ui/Notification/MyPage1.qml"
                            }
                        }
                    }

                    // Advice
                    Rectangle {
                        id: menuAdvice
                        height: 36
                        width: menu.width

                        color: (rightFieldLoader.source == "qrc:/ui/Notification/MyPage2.qml") ? "#32343C" : "transparent"
                        radius: 5

                        Image {
                            id: menuAdviceIcon
                            source: "ui/assets/icon-home-blue.png"
                            height: 20
                            width: 20

                            anchors {
                                left: parent.left
                                verticalCenter: parent.verticalCenter

                                leftMargin: 12
                            }
                        }

                        Text {
                            id: menuAdviceText
                            color: "#0BBCD1"
                            text: "Советы"
                            font.pixelSize: 16
                            font.family: "Arial"
                            font.weight: Font.DemiBold
                            font.letterSpacing: 1

                            anchors {
                                left: menuAdviceIcon.right
                                verticalCenter: parent.verticalCenter

                                leftMargin: 14
                            }
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked:
                            {
                                console.log("Advice Page")
                                rightFieldLoader.source = "qrc:/ui/Notification/MyPage2.qml"
                            }
                        }
                    }

                    // Settings
                    Rectangle {
                        id: menuSettings
                        height: 36
                        width: menu.width

                        color: (rightFieldLoader.source == "qrc:/ui/Notification/MyPage3.qml") ? "#32343C" : "transparent"
                        radius: 5

                        Image {
                            id: menuSettingsIcon
                            source: "ui/assets/icon-home-blue.png"
                            height: 20
                            width: 20

                            anchors {
                                left: parent.left
                                verticalCenter: parent.verticalCenter

                                leftMargin: 12
                            }
                        }

                        Text {
                            id: menuSettingsText
                            color: "#0BBCD1"
                            text: "Настройки"
                            font.pixelSize: 16
                            font.family: "Arial"
                            font.weight: Font.DemiBold
                            font.letterSpacing: 1

                            anchors {
                                left: menuSettingsIcon.right
                                verticalCenter: parent.verticalCenter

                                leftMargin: 14
                            }
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked:
                            {
                                console.log("Settings Page")
                                rightFieldLoader.source = "qrc:/ui/Notification/MyPage3.qml"
                            }
                        }
                    }
                }
            }
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
