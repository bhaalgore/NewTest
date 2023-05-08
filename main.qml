import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "ui/ControlPanel"
import "ui/BottomScreen"
import "ui/Notification"

ApplicationWindow {
    id: mainWindow
    //flags: Qt.Window | Qt.FramelessWindowHint
    width: 1600
    height: 900
    visible: true

    ControlPanel {
       id: controlPanel
    }

    BottomScreen {
        id: bottomScreen
    }

    NotificationArea {
        visible: notifyList.count > 0
        width: notifyList.width
        height: notifyList.height
        ListView {
            id: notifyList
            boundsBehavior: Flickable.StopAtBounds
            implicitWidth: contentItem.childrenRect.width
            implicitHeight: contentItem.childrenRect.height
            spacing: 10
            model: Notificationmodel
            delegate: Notification {
                title: model.title
                message: model.message
                state: model.type
                onClose: Notificationmodel.removeNotification(model.id)
            }
        }
    }
}
