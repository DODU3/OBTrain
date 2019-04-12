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
import RegisterDataFresh 1.0

Page {

    width: 1920
    height: 1080
    font.pointSize: 20


    property StackView stack: null
    property double mlat: 23.1663297;
    property double mlon: 113.4446837;
    property int timecnt: 0;

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
//        anchors.centerIn: parent
        height: 40
        radius: 20
        x:305
        y:48
        border.width: 1
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
//        id: page
        x: 94
        y: 136
        width: 1100
        height: 626
        color: "#00000000"
        border.color: "black"


        Plugin {
            id: mapPlugin
            name: "mapbox"
            PluginParameter { name: "mapbox.access_token"; value: "pk.eyJ1Ijoib3BhbjA4IiwiYSI6ImNqc3BqNWl6MzB5MHk0NXA5ZHB4bG1zZnUifQ.47yI-qeLdGSohWnDWjwibA" }
        }

        PositionSource {
              id: positionSource
              preferredPositioningMethods: PositionSource.NonSatellitePositioningMethods
        }

        Map {

            anchors.fill: parent
            plugin: mapPlugin

            center: QtPositioning.coordinate(23.1663297,113.4446837)//real
            zoomLevel: 30

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
        interval: 300
        repeat: true
        triggeredOnStart: false
        running: true

        onTriggered: {
            if(true === myclassExposeByRegType.getserialOpenFlag())
            {
                if(myclassExposeByRegType.getCurrentPage() === 3)
                {
                    tlatitudex.text = myclassExposeByRegType.getCurrentLat();
                    tlongitudex.text = myclassExposeByRegType.getCurrentLon();
                    teastspeedx.text = myclassExposeByRegType.getCurrentES();
                    tnorthspeedx.text = myclassExposeByRegType.getCurrentNS();
                    tsatellitenumx.text = myclassExposeByRegType.getCurrentSN();
                    thdopx.text = myclassExposeByRegType.getCurrentHDOP();
//                    timecnt++;
//                    if(timecnt > 400)
//                    {
//                        timecnt = 0;
//                    }

//                    if(timecnt < 100)
//                    {
//                        mlat += 0.000005;
//        //                mlon += 0.000005;
//                    }
//                    else if(timecnt < 200)
//                    {
//        //                mlat -= 0.000005;
//                        mlon += 0.000005;
//                    }
//                    else if(timecnt < 300)
//                    {
//                        mlat -= 0.000005;
//        //                mlon -= 0.000005;
//                    }
//                    else if(timecnt < 400)
//                    {
//        //                mlat -= 0.000005;
//                        mlon -= 0.000005;
//                    }

//                    myposition.center = QtPositioning.coordinate(mlat, mlon);
//                    tlatitudex.text = mlat.toFixed(7).toLocaleString();
//                    tlongitudex.text = mlon.toFixed(7).toLocaleString();

                    if(myclassExposeByRegType.getCurrentSN() > 10)
                    {
                        myposition.center = QtPositioning.coordinate(myclassExposeByRegType.getCurrentLat(), myclassExposeByRegType.getCurrentLon());
                        myposition.color = "blue";
                        tfixedx.text = "已定位";
                    }
                    else
                    {
                        myposition.color = "gray";
                        tfixedx.text = "未定位";
                    }
                }
            }
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
        font.bold: true
        font.pointSize: 22
    }

    Text {
        id: tlatitude
        x: 370
        y: 852
        text: qsTr("纬度：")
        font.bold: true
        font.pointSize: 22
    }

    Text {
        id: tfixed
        x: 653
        y: 852
        text: qsTr("定位状态：")
        font.bold: true
        font.pointSize: 22
    }

    Text {
        id: tsatellitenum
        x: 942
        y: 852
        text: qsTr("卫星数目：")
        font.bold: true
        font.pointSize: 22
    }

    Text {
        id: tnorthspeed
        x: 110
        y: 902
        text: qsTr("北向速度：")
        font.bold: true
        font.pointSize: 22
    }

    Text {
        id: teastspeed
        x: 370
        y: 902
        width: 107
        height: 31
        text: qsTr("东向速度：")
        font.bold: true
        font.pointSize: 22

    }

    Text {
        id: tHDOP
        x: 653
        y: 904
        text: qsTr("HDOP：")
        font.bold: true
        font.pointSize: 22
    }

    Text {
        id: tlongitudex
        x: 197
        y: 852
        text: qsTr("113.2831890")
        font.bold: true
        font.pointSize: 22
    }

    Text {
        id: tlatitudex
        x: 449
        y: 852
        text: qsTr("23.2051033")
        font.bold: true
        font.pointSize: 22
    }

    Text {
        id: tfixedx
        x: 788
        y: 852
        text: qsTr("未定位")
        font.bold: true
        font.pointSize: 22
    }

    Text {
        id: tsatellitenumx
        x: 1082
        y: 852
        text: qsTr("0")
        font.bold: true
        font.pointSize: 22
    }

    Text {
        id: tnorthspeedx
        x: 256
        y: 902
        text: qsTr("0")
        font.bold: true
        font.pointSize: 22
    }

    Text {
        id: teastspeedx
        x: 505
        y: 902
        width: 23
        height: 27
        text: qsTr("0")
        font.bold: true
        font.pointSize: 22
    }

    Text {
        id: thdopx
        x: 730
        y: 904
        width: 23
        height: 27
        text: qsTr("0")
        font.bold: true
        font.pointSize: 22
    }

    Button {
        id: buttonopenfolder
        x: 1244
        y: 782
        text: qsTr("打开保存文件夹")
        font.bold: true
        font.pointSize: 22
        enabled: true
        onPressed: {
            mydataFresh.buttonOpenFolderClick("\\Content_resource\\GPS模组\\数据保存\\");
        }
    }

    Timer{
        id:timershowdata
        interval: 1000
        repeat: true
        triggeredOnStart: false

        onTriggered: {

            if(myclassExposeByRegType.getCurrentPage() === 3)
            {
                myclassExposeByRegType.saveGPSData();
                textArea.text = myclassExposeByRegType.getserialSaveAndApp();
                textArea.cursorPosition = textArea.text.length;
            }
        }
    }

    MyDataFresh{
        id:mydataFresh
    }

    DataSaveCompletedPage{
        id:datasavecompletedw
    }

    ScrollView {
        x: 1244
        y: 136
        width: 403
        height: 572
        TextArea {
            id: textArea
            x: -10
            y: -6
            width: 418
            height: 572
//            text: "GPS-数据保存与应用"
            font.family: "Times New Roman"
            font.bold: true
            placeholderText: qsTr("GPS-数据保存与应用")
            //            objectName: "MagDateAppPageText"
//            font.pointSize: 9
            font.pixelSize: 20
            //text: myserialtest1.receivedata
            readOnly: true
            selectByKeyboard: true
            selectByMouse: true
            //background: ""

        }
    }

    Button {
        id: buttonsave
        x: 1404
        y: 714
        text: qsTr("保存")
        font.bold: true
        font.pointSize: 22
        enabled: true

        onPressed: {
            //fileDialog.open();
            //timer1.stop();
            mydataFresh.buttonSaveClick("\\Content_resource\\GPS模组\\数据保存\\", textArea.text);
            //timer1.start();
            datasavecompletedw.show();
        }
    }

    Button {
        id: button
        x: 1244
        y: 714
        text: qsTr("开始打印")
        font.bold: true
        font.pointSize: 22

        onPressed: {
//            textArea.append("aa"+"bb"+"cc");
////                textArea.cursorPosition = textArea.text.length;
            if(mydataFresh.serialDataPrintFlag == true){
                mydataFresh.serialDataPrintFlag = false;
                buttonsave.enabled = true;
                button.text = qsTr("开始打印");
                timershowdata.stop();
            }
            else{
                //开始打印
                mydataFresh.serialDataPrintFlag = true;
                buttonsave.enabled = false;
                button.text = qsTr("停止打印");
                myclassExposeByRegType.clearserialSaveAndApp();
                timershowdata.start();
            }
//            mydataFresh.buttonStartClick();

        }

    }

    Image {
        id: refresh_button
        source: "../../Component/refresh.png"
        x: 84
        y: 50
        height: 38
        width: 36
        MouseArea{
            anchors.fill: parent
            onClicked: {
                myclassExposeByRegType.getPortInfo();
                comboModel.setComboList(myclassExposeByRegType.receivePort());
            }
        }
    }
}

