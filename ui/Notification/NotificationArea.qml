import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id: notificationArea
    flags: Qt.WA_TranslucentBackground | Qt.FramelessWindowHint | Qt.WA_TransparentForMouseEvents | Qt.WindowStaysOnTopHint

    color: "#00000000"
    visible: true
    height: mainWindow.height / 4 + 15
    width: mainWindow.width / 5    
    // Set the window position to the bottom right corner
        x: Screen.width - width
        y: Screen.height - height
        opacity : 1
}
