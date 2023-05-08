import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id: notificationArea
    flags: Qt.WA_TranslucentBackground | Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint

    color: "#00000000"
    visible: true
    height: contentItem.childrenRect.height//mainWindow.height / 4 + 15
    width: contentItem.childrenRect.width//mainWindow.width / 5
}
