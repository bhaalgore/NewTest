import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: rec
    property string title: ""
    property string message: ""
    property string type: ""
    property string time: ""

    height: 60
    width: 550
    visible: true
    radius: 10

    Component.onCompleted: {
        switch (type) {
        case "NOTIFY":
            color = Qt.rgba(176 / 255, 68 / 255, 68 / 255, 0.9)
            break
        case "WARNING":
            color = Qt.rgba(33 / 255, 33 / 255, 49 / 255, 0.9)
            break
        case "ALARM":
            color = Qt.rgba(176 / 255, 127 / 255, 0, 0.9)
            break
        case "DEFAULT":
            color = Qt.rgba(176 / 255, 68 / 255, 68 / 255, 0.5)
        }
    }

    ColumnLayout {
        id: columnLayout
        width: parent.width
        Text {
            text: title
            Layout.leftMargin: 7
            color: "#DDDDDD"
            font.pointSize: ((rec.height / 5) + (rec.width / 10)) / 5
            font.weight: "DemiBold"
            font.family: "OpenSans"
        }

        RowLayout {
            Text {
                text: message
                Layout.leftMargin: 7
                color: "#DDDDDD"
                font.pointSize: ((rec.height / 5) + (rec.width / 10)) / 6
                font.family: "OpenSans"
            }
            Text {
                text: time
                Layout.leftMargin: 7
                color: "#DDDDDD"
                font.pointSize: ((rec.height / 5) + (rec.width / 10)) / 6
                font.family: "OpenSans"
            }
        }
    }
}
