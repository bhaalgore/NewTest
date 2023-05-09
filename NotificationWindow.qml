import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15

Window {
    id: notification_window
    property string title: ""
    property string message: ""
    property string type: ""
    property int pos:0
    flags: Qt.FramelessWindowHint
    height:75
    width: 300
    maximumHeight: height
    maximumWidth: width
    visible:true
    x:Screen.width - width - 10
    y:Screen.height - height - pos
    onTypeChanged: {
        console.log(y)
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
//    Timer {
//           interval: 15000; running: true; repeat: false
//           onTriggered: visible = false
//       }

    Image {
        id: closeNotificationIcon
        anchors {
            top:parent.top
            right:parent.right
            topMargin: 14
            rightMargin: 22
        }

        MouseArea {
            anchors.fill: parent
            onClicked: notification_window.close()

        }
        fillMode: Image.PreserveAspectFit
        source: "qrc:/ui/assets/closenoticon.png"
    }

    ColumnLayout {
        id: columnLayout
        width:parent.width

        Text {
            text: title
            Layout.leftMargin: 7
            Layout.topMargin: 10
            color: "#DDDDDD"
            font.pointSize: ((notification_window.height/5) + (notification_window.width /10))/4
            font.weight: "DemiBold"
            font.family: "OpenSans"
        }
        Text {
            text: message
            Layout.leftMargin: 7
            color: "#DDDDDD"
            font.pointSize: ((notification_window.height/5) + (notification_window.width /10))/6
            font.family: "OpenSans"
        }
    }
}
