import QtQuick 2.15
import QtGraphicalEffects 1.15

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
