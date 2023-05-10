import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: rec
    property string title: ""
    property string message: ""
    property string state: ""

    height: 60
    width: root.width - 85
    visible:true

    Component.onCompleted: {
            switch (state) {
                case "NOTIFY":
                    color = Qt.rgba(176/255, 68/255, 68/255, 0.9);
                    break;
                case "WARNING":
                    color = Qt.rgba(33/255, 33/255, 49/255, 0.9);
                    break;
                case "ALARM":
                    color = Qt.rgba(176/255, 127/255, 0, 0.9);
                    break;
                case "DEFAULT":
                    color = Qt.rgba(176/255, 68/255, 68/255, 0.5);
            }
        }

    Image {
        id: closeNotificationIcon
        source: "qrc:/ui/assets/close.svg"
        width:13
        height:14
        anchors{
            top:parent.top
            right:parent.right
            topMargin: 14
            rightMargin: 22
        }

        MouseArea {
            anchors.fill: parent
            onClicked: rec.visible = false

        }


    }

    ColumnLayout {
        id: columnLayout
        width:parent.width

            Text {
                text: title
                Layout.leftMargin: 7
                Layout.topMargin: 10
                color: "#DDDDDD"
                font.pointSize: ((rec.height/5) + (rec.width /10))/4
                font.weight: "DemiBold"
                font.family: "OpenSans"
            }


        Text {
            text: message
            Layout.leftMargin: 7
            color: "#DDDDDD"
            font.pointSize: ((rec.height/5) + (rec.width /10))/6
            font.family: "OpenSans"
        }

    }

}
