import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15


Rectangle {
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

                color: (rightFieldLoader.source
                        == "qrc:/ui/Notification/MyPage.qml") ? "#32343C" : "transparent"
                radius: 5

                Image {
                    id: menuMainIcon
                    source: "qrc:/ui/assets/home.svg"
                    height: 20
                    width: 20
                    visible: false
                    anchors {
                        left: parent.left
                        verticalCenter: parent.verticalCenter

                        leftMargin: 12
                    }
                }
                ColorOverlay{
                       anchors.fill: menuMainIcon
                       source: menuMainIcon
                       color: (rightFieldLoader.source
                               == "qrc:/ui/Notification/MyPage.qml") ? "#0BBCD1" : "#DDDDDD"
                       antialiasing: true
                }

                Text {
                    id: menuMainText
                    text: "Главная"
                    font.pixelSize: 16
                    font.family: "Arial"
                    font.weight: Font.DemiBold
                    font.letterSpacing: 1
                    color: (rightFieldLoader.source
                            == "qrc:/ui/Notification/MyPage.qml") ? "#0BBCD1" : "#DDDDDD"
                    anchors {
                        left: menuMainIcon.right
                        verticalCenter: parent.verticalCenter

                        leftMargin: 14
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
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

                color: (rightFieldLoader.source
                        == "qrc:/ui/Notification/MyPage1.qml") ? "#32343C" : "transparent"
                radius: 5

                Image {
                    id: menuArchiveIcon
                    source: "qrc:/ui/assets/envelope.svg"
                    height: 20
                    width: 20
                    visible: false
                    anchors {
                        left: parent.left
                        verticalCenter: parent.verticalCenter

                        leftMargin: 12
                    }
                }
                ColorOverlay{
                       anchors.fill: menuArchiveIcon
                       source: menuArchiveIcon
                       color: (rightFieldLoader.source
                               == "qrc:/ui/Notification/MyPage1.qml") ? "#0BBCD1" : "#DDDDDD"
                       antialiasing: true
                }
                Text {
                    id: menuArchiveText
                    text: "Архив"
                    font.pixelSize: 16
                    font.family: "Arial"
                    font.weight: Font.DemiBold
                    font.letterSpacing: 1
                    color: (rightFieldLoader.source
                            == "qrc:/ui/Notification/MyPage1.qml") ? "#0BBCD1" : "#DDDDDD"
                    anchors {
                        left: menuArchiveIcon.right
                        verticalCenter: parent.verticalCenter

                        leftMargin: 14
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
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

                color: (rightFieldLoader.source
                        == "qrc:/ui/Notification/MyPage2.qml") ? "#32343C" : "transparent"
                radius: 5

                Image {
                    id: menuAdviceIcon
                    source: "qrc:/ui/assets/recommendations.svg"
                    height: 20
                    width: 20
                    visible: false
                    anchors {
                        left: parent.left
                        verticalCenter: parent.verticalCenter

                        leftMargin: 12
                    }
                }
                ColorOverlay{
                       anchors.fill: menuAdviceIcon
                       source: menuAdviceIcon
                       color: (rightFieldLoader.source
                               == "qrc:/ui/Notification/MyPage2.qml") ? "#0BBCD1" : "#DDDDDD"
                       antialiasing: true
                }
                Text {
                    id: menuAdviceText
                    text: "Советы"
                    font.pixelSize: 16
                    font.family: "Arial"
                    font.weight: Font.DemiBold
                    font.letterSpacing: 1
                    color: (rightFieldLoader.source
                            == "qrc:/ui/Notification/MyPage2.qml") ? "#0BBCD1" : "#DDDDDD"
                    anchors {
                        left: menuAdviceIcon.right
                        verticalCenter: parent.verticalCenter

                        leftMargin: 14
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
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

                color: (rightFieldLoader.source
                        == "qrc:/ui/Notification/MyPage3.qml") ? "#32343C" : "transparent"
                radius: 5

                Image {
                    id: menuSettingsIcon
                    source: "qrc:/ui/assets/settings.svg"
                    height: 20
                    width: 20
                    visible: false
                    anchors {
                        left: parent.left
                        verticalCenter: parent.verticalCenter

                        leftMargin: 12
                    }
                }

                ColorOverlay{
                       anchors.fill: menuSettingsIcon
                       source: menuSettingsIcon
                       color: (rightFieldLoader.source
                               == "qrc:/ui/Notification/MyPage3.qml") ? "#0BBCD1" : "#DDDDDD"
                       antialiasing: true
                }

                Text {
                    id: menuSettingsText
                    text: "Настройки"
                    font.pixelSize: 16
                    font.family: "Arial"
                    font.weight: Font.DemiBold
                    font.letterSpacing: 1
                    color: (rightFieldLoader.source
                            == "qrc:/ui/Notification/MyPage3.qml") ? "#0BBCD1" : "#DDDDDD"
                    anchors {
                        left: menuSettingsIcon.right
                        verticalCenter: parent.verticalCenter

                        leftMargin: 14
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        console.log("Settings Page")
                        rightFieldLoader.source = "qrc:/ui/Notification/MyPage3.qml"
                    }
                }
            }
        }
    }
}
