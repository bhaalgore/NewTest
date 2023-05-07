import QtQuick 2.15
import QtLocation 5.12
import QtPositioning 5.12

Rectangle {
    id: bottomScreen
    anchors{
        left: parent.left
        right: parent.right
        top: controlPanel.bottom
        bottom: parent.bottom
    }
   // color: "red"
    Image {
        anchors.fill: parent
        source: "qrc:/ui/assets/map.png"
    }

//    Plugin {
//        id:mapPlugin
//        name: "osm"

//    }

//    Map {
//        anchors.fill:parent
//        plugin: mapPlugin
//        center: QtPositioning.coordinate(59.91, 10.75) // Tomsk
//        zoomLevel: 14
//    }

}
