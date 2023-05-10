import QtQuick 2.15

Rectangle {
    id: advicePage
    color: "transparent"

    Text {
        id: header
        text: "Советы"

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
}
