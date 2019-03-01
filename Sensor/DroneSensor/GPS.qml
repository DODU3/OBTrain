import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.0
import Qt.labs.platform 1.0
import QtLocation 5.6
import QtPositioning 5.6
import ".."

Page {

    width: 1920
    height: 1080


    property StackView stack: null

    background: Image {
        source: "../../images/background.png"
    }

    Button {
        height: 32
        width: 120
        text: "<-"
        anchors.left: parent.left
        anchors.top: parent.top
        onClicked: stack.pop()
    }

    Label{
        id: label
        text: qsTr("GPS")
        anchors.verticalCenterOffset: -250
        anchors.horizontalCenterOffset: 0
        height: 80
        width: 240
        anchors.centerIn: parent
        font.pixelSize: 20
    }

    Button {
        id: button
        x: 51
        y: 148
        text: qsTr("简介")
        onClicked:
        {
            fileDialog1.open();
        }
//        MouseArea{
//            anchors.fill: parent
//            onClicked: {
//                fileDialog1.open()
//            }
//        }
    }



    Button {
        id: button1
        x: 51
        y: 251
        text: qsTr("工程实例")
        onClicked:
        {
            console.debug(qsTr("点击了插件中的按钮"));
        }

//        MouseArea{
//            id:mouseArea
//            anchors.fill: parent
//            onPressed: {
//                console.debug(qsTr("点击了插件中的按钮"));
//            }
//        }
    }

    FileDialog {
        id: fileDialog1
        fileMode: FileDialog.OpenFile
        nameFilters: ["图像文件 (*.png *.jpg *.gif *.bmp)", "全部文件 (*.*)"]
        options :FileDialog.ReadOnly
    }

    Page {
        id: page
        x: 191
        y: 116
        width: 419
        height: 302

        Plugin {
            id: mapPlugin
            name: "osm" // "mapboxgl", "esri", ...
            // specify plugin parameters if necessary
            // PluginParameter {
            //     name:
            //     value:
            // }
        }

        Map {
            anchors.fill: parent
            plugin: mapPlugin
            center: QtPositioning.coordinate(23.40338, 122.17403) // Oslo
            zoomLevel: 14
        }
    }


}

