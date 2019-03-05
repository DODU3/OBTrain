import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.0
import Qt.labs.platform 1.0

import QtLocation 5.6
import QtPositioning 5.6

import "../../Component"
import ".."
import "./UartData"
import "./GPSPage"

import RegisterMyType 1.0


Page {

    width: 1920
    height: 1080
    font.pointSize: 20


    property StackView stack: null
    property double mlat: 23.1663297;
    property double mlon: 113.4446837;

    background: Image {
        source: "../../images/background.png"
    }


    Button {
        height: 32
        width: 120
        text: "<-"
        anchors.left: parent.left
        anchors.top: parent.top
        onClicked: {
            if(true === myclassExposeByRegType.getserialOpenFlag()){
                //myclassExposeByRegType.closePort();
                qmlToggleButton.toggleRight();
//                qmlToggleButton.state = "right";
//                qmlToggleButton.color = "#CCCCCC";

            }
            stack.pop()
        }
    }

    ComboBox {
        id: comboBox
        objectName: "portComboBox"
        x: 146
        y: 48
        font.bold: true
        font.pointSize: 20

        model:comboModel.comboList
    }

    QmlToggleButton{
        id: qmlToggleButton
        anchors.centerIn: parent
        height: 40
        radius: 20
        border.width: 1
        anchors.verticalCenterOffset: -472
        anchors.horizontalCenterOffset: -614
        width: 106
    }

    Button {
        id: button7
        x: 437
        y: 48
        text: qsTr("配置无线地址")
        font.bold: true
        font.pointSize: 20

        onClicked:
        {
            rfsetpage.show();
        }

    }

    Button {
        id: button1
        x: 653
        y: 50
        text: qsTr("教学资料")
        font.bold: true
        font.pointSize: 20

        onClicked:
        {
            gpsinfopage.show();
        }

    }

    Button {
        id: button2
        x: 821
        y: 48
        text: qsTr("工程实例")
        font.bold: true
        font.pointSize: 20

        onClicked:
        {
            gpsprojectdeveloppage.active;
            gpsprojectdeveloppage.show();
        }
    }

    Connections {
        target: qmlToggleButton
        onToggleRight: {
            myclassExposeByRegType.closePort();

        }

    }

    Connections {
        target: qmlToggleButton
        onToggleLeft: {
            var portName;
            var keys = Object.keys(comboBox);
            for(var i = 0; i < keys.length; i++) {
                var key = keys[i];

                if (key === "currentIndex") {
//                    console.log("key FOUND:" + comboBox[key]);
                    portName = comboModel.getElement(comboBox[key]);

                    break;
                }
            }
            myclassExposeByRegType.openAndSetPort(portName,3,3,0,0,0);

        }
    }

    Rectangle {
        x:1262
        y:570
        width: 402
        height: 400
        color: "#00000000"
        border.width: 1

        DataBasicRecAndSendPage{
            id:magbasicrecandsendpage
            x:2
            y:2
            width: 400
            height: 400
        }
    }

    Rectangle {
        x:1263
        y:130
        width: 583
        height: 400
        color: "#00000000"
        border.width: 1

        GPSDataApplicatePage{
            id:gpsdataapplicatepage
            x:2
            y:2
            width: 583
            height: 400
        }
    }



    Component.onCompleted: {

        myclassExposeByRegType.getPortInfo();
        comboModel.setComboList(myclassExposeByRegType.receivePort());
//        console.log(positionSource.position.coordinate.latitude,
//                    positionSource.position.coordinate.longitude)
    }

//    FileDialog {
//        id: fileDialog1
//        fileMode: FileDialog.OpenFile
//        nameFilters: ["图像文件 (*.png *.jpg *.gif *.bmp)", "全部文件 (*.*)"]
//        options :FileDialog.ReadOnly
//    }

    Rectangle {
//        id: page
        x: 94
        y: 136
        width: 1100
        height: 626
        color: "#00000000"
        border.color: "black"

//        Plugin {
//            id: mapPlugin
//            name: "esri"//"osm" // "mapboxgl", "esri", ...
//            // specify plugin parameters if necessary
//            // PluginParameter {
//            //     name:
//            //     value:
//            // }
//        }

//        Plugin {
//            id: mapPlugin
//            name: "here"
//            PluginParameter { name: "here.app_id"; value: "8F4T8umUsqqY7fqPhPyv" }
//            PluginParameter { name: "here.token"; value: "Z1n4QqLuzFs7qbUUzb6NHA" }
//        }

        Plugin {
            id: mapPlugin
            name: "mapbox"
            PluginParameter { name: "mapbox.access_token"; value: "pk.eyJ1Ijoib3BhbjA4IiwiYSI6ImNqc3BqNWl6MzB5MHk0NXA5ZHB4bG1zZnUifQ.47yI-qeLdGSohWnDWjwibA" }
        }


//        fail
//        Plugin {
//            name: "osm"
//            PluginParameter { name: "osm.useragent"; value: "My great Qt OSM application" }
//            PluginParameter { name: "osm.mapping.host"; value: "http://osm.tile.server.address/" }
//            PluginParameter { name: "osm.mapping.copyright"; value: "All mine" }
//            PluginParameter { name: "osm.routing.host"; value: "http://osrm.server.address/viaroute" }
//            PluginParameter { name: "osm.geocoding.host"; value: "http://geocoding.server.address" }
//        }

        PositionSource {
              id: positionSource
              preferredPositioningMethods: PositionSource.NonSatellitePositioningMethods
        }

        Map {
//            anchors.leftMargin: -137
//            anchors.topMargin: 0
//            anchors.rightMargin: -596
//            anchors.bottomMargin: -438
            anchors.fill: parent
            plugin: mapPlugin
//            center: QtPositioning.coordinate(23.205103, 113.283189) // Oslo
//            center: QtPositioning.coordinate(23.1633590600,113.4441661500)
//            center: QtPositioning.coordinate(23.1642584618,113.4512493141)
            center: QtPositioning.coordinate(23.1663297,113.4446837)//real
            zoomLevel: 30
//            MapType: MapType.StreetMap

            MapCircle {
                id: myposition
                center:  QtPositioning.coordinate(23.1663297,113.4446837)//positionSource.position.coordinate
                radius: 3
                color: "blue"//"#00000000"//'green'
                border.width: 2
                border.color: "white"
            }


        }
    }

    Timer {
        id:timer1
        interval: 100
        repeat: true
        triggeredOnStart: false
        running: true

        onTriggered: {
            tlatitudex.text = myclassExposeByRegType.getCurrentLat();
            tlongitudex.text = myclassExposeByRegType.getCurrentLon();
            teastspeedx.text = myclassExposeByRegType.getCurrentES();
            tnorthspeedx.text = myclassExposeByRegType.getCurrentNS();
            tsatellitenumx.text = myclassExposeByRegType.getCurrentSN();
            thdopx.text = myclassExposeByRegType.getCurrentHDOP();
//            mlat += 0.000001;
//            mlon += 0.000001;
//            myposition.center = QtPositioning.coordinate(myclassExposeByRegType.getCurrentLat(), myclassExposeByRegType.getCurrentLon());
        }
    }

    MyClassType
    {
        id:myclassExposeByRegType
    }

    RFSetPage{
        id:rfsetpage
    }

    GPSProjectDevelopPage{
        id:gpsprojectdeveloppage
    }

    GPSInfoPage{
        id:gpsinfopage
    }

    Text {
        id: tlongitude
        x: 110
        y: 852
        text: qsTr("经度：")
        font.pointSize: 20
    }

    Text {
        id: tlatitude
        x: 370
        y: 852
        text: qsTr("纬度：")
        font.pointSize: 20
    }

    Text {
        id: tfixed
        x: 653
        y: 852
        text: qsTr("定位状态：")
        font.pointSize: 20
    }

    Text {
        id: tsatellitenum
        x: 942
        y: 852
        text: qsTr("卫星数目：")
        font.pointSize: 20
    }

    Text {
        id: tnorthspeed
        x: 110
        y: 902
        text: qsTr("北向速度：")
        font.pointSize: 20
    }

    Text {
        id: teastspeed
        x: 370
        y: 902
        width: 54
        height: 31
        text: qsTr("东向速度：")
        font.pointSize: 20

    }

    Text {
        id: tHDOP
        x: 653
        y: 904
        text: qsTr("HDOP：")
        font.pointSize: 20
    }

    Text {
        id: tlongitudex
        x: 197
        y: 852
        text: qsTr("113.283189")
        font.pointSize: 20
    }

    Text {
        id: tlatitudex
        x: 449
        y: 852
        text: qsTr("23.205103")
        font.pointSize: 20
    }

    Text {
        id: tfixedx
        x: 788
        y: 852
        text: qsTr("未定位")
        font.pointSize: 20
    }

    Text {
        id: tsatellitenumx
        x: 1074
        y: 852
        text: qsTr("0")
        font.pointSize: 20
    }

    Text {
        id: tnorthspeedx
        x: 251
        y: 906
        text: qsTr("0")
        font.pointSize: 20
    }

    Text {
        id: teastspeedx
        x: 501
        y: 906
        width: 23
        height: 27
        text: qsTr("0")
        font.pointSize: 20
    }

    Text {
        id: thdopx
        x: 730
        y: 904
        width: 23
        height: 27
        text: qsTr("0")
        font.pointSize: 20
    }

//    Button {
//        id: button3
//        x: 94
//        y: 788
//        text: qsTr("当前位置")
//        font.bold: true
//        font.pointSize: 20
//        onClicked: {
//            console.log(positionSource.position.coordinate.latitude,
//                        positionSource.position.coordinate.longitude)
//        }
//    }

}

