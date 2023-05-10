import QtQuick 2.15
import "../Notification"

Rectangle {
    id: root
    color: "transparent"

    Text {
        id: contentText
        text: "Архив"
        font.pixelSize: 24
        font.family: "Arial"
        font.weight: Font.DemiBold
        font.letterSpacing: 1
        anchors.top: root.top
        anchors.left: root.left
        anchors.topMargin: 25
        anchors.leftMargin: 40
        color: "#DDDDDD"
    }

    ListView {
        id: notifyList
        spacing: 20
        model: Notificationmodel
        height: parent.height
        width: parent.width
        anchors{
            top:contentText.top
            left:contentText.left
            topMargin: 35
            leftMargin: 30

        }
        delegate: Notification {
            title: model.title
            message: model.message
            state: model.type
        }
    }
}
