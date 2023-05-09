import QtQuick 2.15
import QtGraphicalEffects 1.15

// Main
Rectangle {
    property var qrcRightField
    property var qrcIcon
    property var sectionName
    id: section
    height: 36
    width: menu.width
    color: (rightFieldLoader.source
<<<<<<< refs/remotes/origin/features:ui/LeftArea/MenuMain.qml
            == "qrc:/ui/RightArea/MainPage.qml") ? "#32343C" : "transparent"
=======
            == qrcRightField) ? "#32343C" : "transparent"
>>>>>>> Создал единый компонент для секции меню:ui/LeftArea/MenuSection.qml
    radius: 5

    Image {
        id: icon
        source: qrcIcon
        height: 20
        width: 20
        visible: false
        anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
            leftMargin: 12
        }
    }

    ColorOverlay {
           anchors.fill: icon
           source: icon
           color: (rightFieldLoader.source
<<<<<<< refs/remotes/origin/features:ui/LeftArea/MenuMain.qml
                   == "qrc:/ui/RightArea/MainPage.qml") ? "#0BBCD1" : "#DDDDDD"
=======
                   == qrcRightField) ? "#0BBCD1" : "#DDDDDD"
>>>>>>> Создал единый компонент для секции меню:ui/LeftArea/MenuSection.qml
           antialiasing: true
    }

    Text {
        id: text
        text: sectionName
        font.pixelSize: 16
        font.family: "Arial"
        font.letterSpacing: 1
        font.weight: (rightFieldLoader.source
                      == qrcRightField) ? Font.DemiBold : Font.ExtraLight
        color: (rightFieldLoader.source
<<<<<<< refs/remotes/origin/features:ui/LeftArea/MenuMain.qml
                == "qrc:/ui/RightArea/MainPage.qml") ? "#0BBCD1" : "#DDDDDD"
=======
                == qrcRightField) ? "#0BBCD1" : "#DDDDDD"
>>>>>>> Создал единый компонент для секции меню:ui/LeftArea/MenuSection.qml
        anchors {
            left: icon.right
            verticalCenter: parent.verticalCenter
            leftMargin: 14
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
<<<<<<< refs/remotes/origin/features:ui/LeftArea/MenuMain.qml
            console.log("Main page")
            rightFieldLoader.source = "qrc:/ui/RightArea/MainPage.qml"
=======
            rightFieldLoader.source = qrcRightField
>>>>>>> Создал единый компонент для секции меню:ui/LeftArea/MenuSection.qml
        }
    }
}
