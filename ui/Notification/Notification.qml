import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: rec
    property string title: ""
    property string message: ""
    property string state: ""

    height: childrenRect.height
    width: mainWindow.width / 6
    visible: true

    signal close()

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

    ColumnLayout {
        id: columnLayout
        width: parent.width

        RowLayout {
            id: rowLayout
            Layout.preferredWidth: parent.width
            Layout.fillWidth: true

            Text {
                id: titleText
                text: "asddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd"//title
                elide: Text.ElideRight
                Layout.leftMargin: 5
                Layout.maximumWidth: parent.width - closeNotificationIcon.width
                                     - titleText.Layout.leftMargin
                                     - closeNotificationIcon.Layout.rightMargin
                                     - rowLayout.spacing

                color: "#DDDDDD"
                font.weight: "DemiBold"
                font.family: "OpenSans"
                HoverHandler{
                    id: titleHoverHandler
                }
                ToolTip {
                    text: parent.text
                    visible: titleHoverHandler.hovered && parent.truncated
                    delay: 500
                }
            }
            Image {
                id: closeNotificationIcon
                Layout.alignment: Qt.AlignRight
                Layout.rightMargin: 5
                fillMode: Image.PreserveAspectFit
                source: "qrc:/ui/assets/closenoticon.png"
                MouseArea {
                    anchors.fill: parent
                    onClicked: rec.close()
                }
            }
        }

        Text {
            text: "asdddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddasdddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddasdddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddasddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd"//message
            Layout.fillWidth: true
            Layout.leftMargin: 5
            Layout.rightMargin: 5
            maximumLineCount: 5
            wrapMode: Text.Wrap
            elide: Text.ElideRight
            color: "#DDDDDD"
            font.family: "OpenSans"
            HoverHandler{
                id: messageHoverHandler
            }
            ToolTip {
                text: parent.text
                visible: messageHoverHandler.hovered && parent.truncated
                delay: 500
            }
        }
    }
}
