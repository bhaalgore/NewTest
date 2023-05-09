import QtQuick 2.15
import QtGraphicalEffects 1.15

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

    ColorOverlay {
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
