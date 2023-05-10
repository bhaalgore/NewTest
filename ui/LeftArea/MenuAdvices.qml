import QtQuick 2.15
import QtGraphicalEffects 1.15

Rectangle {
    id: menuAdvice
    height: 36
    width: menu.width
    radius: 5
    color : (rightFieldLoader.source
                   == "qrc:/ui/RightArea/AdvicesPage.qml") ? "#32343C" : "transparent"
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

    ColorOverlay {
           anchors.fill: menuAdviceIcon
           source: menuAdviceIcon
           color: (rightFieldLoader.source
                   == "qrc:/ui/RightArea/AdvicesPage.qml") ? "#0BBCD1" : "#DDDDDD"
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
                == "qrc:/ui/RightArea/AdvicesPage.qml") ? "#0BBCD1" : "#DDDDDD"
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
            rightFieldLoader.source = "qrc:/ui/RightArea/AdvicesPage.qml"
        }
    }
}
