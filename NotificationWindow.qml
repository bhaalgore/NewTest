import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15

Window {
    id: notification_window

    property string title: ""
    property string message: ""
    property string type: ""

    flags: Qt.FramelessWindowHint

    height: 80
    width: 400
    maximumHeight: height
    maximumWidth: width

    x:Screen.width - width - 10
    y:Screen.height - height

    visible:true
    opacity: 0.8
    onTypeChanged: {
            switch (type) {
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
                    break;
            }
        }

    Image {
        id: closeNotificationIcon
        source: "qrc:/ui/assets/close.svg"
        width: 14
        height: 14
//        fillMode: Image.PreserveAspectFit

        anchors {
            top:parent.top
            right:parent.right
            topMargin: 14
            rightMargin: 14
        }

        MouseArea {
            anchors.fill: parent
            onClicked: notification_window.close()
        }
    }

    ColumnLayout {
        id: columnLayout
        anchors {
            top: parent.top
            left: parent.left

            topMargin: 8
            leftMargin: 14
        }

        Text {
            text: title
            color: "#DDDDDD"
            font {
                pixelSize: 18
                weight: Font.DemiBold
                family: "Arial"
            }
        }
        Item {
            width: 380
            Text {
                text: message
                color: "#DDDDDD"
                width: parent.width
                font {
                    pixelSize: 14
                    family: "Arial"
                }

                wrapMode: Text.Wrap
            }

        }
    }
}
