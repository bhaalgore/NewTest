import QtQuick 2.15
import "../Notification"

Rectangle {
    id: root
    color: "transparent"

    Text {
        id: header
        text: "Архив"

        font {
            pixelSize: 24
            family: "Arial"
            weight: Font.DemiBold
            letterSpacing: 1
        }

        anchors {
            top: parent.top
            left: parent.left
            topMargin: 24
            leftMargin: 40
        }
        color: "#DDDDDD"
    }

    ListView {
        id: notifyList
        spacing: 20
        model: HistoryModel
        height: parent.height
        width: parent.width
        anchors{
            top: header.top
            left: header.left
            topMargin: 35
            leftMargin: 30

        }
        delegate: Notification {
            title: model.title
            message: model.message
            type: model.type
            date: model.date
        }
    }
}
