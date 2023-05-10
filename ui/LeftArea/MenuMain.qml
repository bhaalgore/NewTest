import QtQuick 2.15
import QtGraphicalEffects 1.15

// Main
Rectangle {
    id: menuMain
    height: 36
    width: menu.width
    color: (rightFieldLoader.source
            == "qrc:/ui/RightArea/MainPage.qml") ? "#32343C" : "transparent"
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

    ColorOverlay {
           anchors.fill: menuMainIcon
           source: menuMainIcon
           color: (rightFieldLoader.source
                   == "qrc:/ui/RightArea/MainPage.qml") ? "#0BBCD1" : "#DDDDDD"
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
                == "qrc:/ui/RightArea/MainPage.qml") ? "#0BBCD1" : "#DDDDDD"
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
            rightFieldLoader.source = "qrc:/ui/RightArea/MainPage.qml"
        }
    }
}
