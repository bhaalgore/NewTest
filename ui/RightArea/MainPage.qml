import QtQuick 2.15


Rectangle {
    id: mainPage
    color: "transparent"

    Text {
        id: header
        text: "Do not miss\nany signal"
        font.pixelSize: 36
        font.family: "Arial"
        font.weight: Font.DemiBold
        font.letterSpacing: 1
        anchors.top: mainPage.top
        anchors.left: mainPage.left
        anchors.topMargin: 66
        anchors.leftMargin: 30
        color: "#FFFFFF"
    }
}
