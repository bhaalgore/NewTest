import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "ui/ControlPanel"
import "ui/BottomScreen"
import "ui/Notification"
import QtQuick.Controls 1.4
ApplicationWindow {
    id: mainWindow
    width: 1600
    height: 900
    visible: true

        ControlPanel {
           id: controlPanel
        }

        BottomScreen {
              id: bottomScreen
              NotificationArea {
                  Calendar {
                      id: calendar
                      onSelectedDateChanged: {
                          HistoryModel.selectByDate(calendar.selectedDate.toISOString().slice(0, 10));
                          console.log(HistoryModel);
                          console.log(calendar.selectedDate);
                      }
                  }
              ListView {
                  id: notifyList
                  spacing: 10
                  model: HistoryModel
                  anchors{
                      top:parent.top-10
                      right:parent.right
                      left:parent.left
                      bottom:parent.bottom
                      topMargin: 25
                      rightMargin: 25

                  }

                  height: parent.height/2
                  width: parent.width/6
                  delegate: Notification {
                      title: model.title
                      message: model.message
                      date: model.date
                  }
              }
              }
    }
}
