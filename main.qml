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

    //BottomScreen {
    //      id: bottomScreen
//          NotificationArea {
//              ListView {
//                  id: notifyList
//                  spacing: 10
//                  model: Notificationmodel
//                  anchors{
//                      top:parent.top
//                      right:parent.right
//                      topMargin: 25
//                      rightMargin: 25

//                  }

//                  height: parent.height/2
//                  width: parent.width/6
//                  delegate: Notification {
//                      title: model.title
//                      message: model.message
//                      state: model.type
//                      onClose: Notificationmodel.removeNotification(model.id)
//                  }
//              }
//          }
    //}

    NotificationArea {
        visible: notifyList.count > 0
        ListView {
            id: notifyList
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
