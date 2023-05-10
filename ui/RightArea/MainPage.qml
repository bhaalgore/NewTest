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

    Item {
        width: 274
        height: 270
        anchors {
            top: parent.top
            right: parent.right

            topMargin: 50
            rightMargin: -38
        }

        Image {
            source: "qrc:/ui/assets/shape1.png"
        }
    }

    MainPageRect {
        primaryText: "Micran"
        secondaryText: "Сайт компании"

        anchors {
            top: parent.top
            right: parent.right

            topMargin: 160
            rightMargin: 38
        }

        MouseArea {
            anchors.fill: parent
            onClicked: Qt.openUrlExternally("https://www.micran.ru")
        }
    }

    Item {
        width: 352
        height: 308
        anchors {
            top: parent.top
            left: parent.left

            topMargin: 176
            leftMargin: -58
        }

        Image {
            source: "qrc:/ui/assets/shape2.png"
        }
    }

    MainPageRect {
        primaryText: "Версия 0.1.0"
        secondaryText: "Первая альфа"

        anchors {
            top: parent.top
            left: parent.left

            topMargin: 300
            leftMargin: 30
        }
    }

    Item {
        width: 318.43
        height: 298.97
        anchors {
            top: parent.top
            right: parent.right

            topMargin: 340
            rightMargin: -90
        }

        Image {
            source: "qrc:/ui/assets/shape3.png"
        }
    }

    MainPageRect {
        primaryText: "Notification Manager"
        secondaryText: "О приложении"

        anchors {
            top: parent.top
            right: parent.right

            topMargin: 446
            rightMargin: 38
        }
    }

}
