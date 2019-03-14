import QtQuick 2.9
import QtQuick.Controls 2.2

import QtMultimedia 5.4

import ".."
import "../../Component"
//import "./PresentPage"
import "./BaroPage"
import "./UartData"

import RegisterMyType 1.0
import RegisterSystemOpen 1.0


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
        x: 300
        y: 48
        height: 40
        radius: 20
        border.width: 1
//        anchors.verticalCenterOffset: -472
//        anchors.horizontalCenterOffset: -603
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
            baroinfopage.show();
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
            baroprojectdeveloppage.active;
            baroprojectdeveloppage.show();
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

    BaroCharViewPage
    {
        id:barocharview
        x:106
        y:570
        width: 1150
        height: 400
        visible: true
    }

    Rectangle {
        x:1313
        y:131
        width: 402
        height: 400
        color: "#00000000"
        border.width: 1

        DataBasicRecAndSendPage{
            id:barobasicrecandsendpage
            x:2
            y:2
            width: 400
            height: 400
        }
    }

    Rectangle {
        x:1313
        y:570
        width: 402
        height: 400
        color: "#00000000"
        border.width: 1

        BaroDataApplicatePage{
            id:barodataapplicatepage
            x:2
            y:2
            width: 400
            height: 400
        }
    }

    Component.onCompleted: {

        myclassExposeByRegType.getPortInfo();
        comboModel.setComboList(myclassExposeByRegType.receivePort());
        //        console.log(positionSource.position.coordinate.latitude,
        //                    positionSource.position.coordinate.longitude)
    }

    MyClassType
    {
        id:myclassExposeByRegType
    }

    RFSetPage{
        id:rfsetpage
    }

    BaroProjectDevelopPage{
        id:baroprojectdeveloppage
    }

    BaroInfoPage{
        id:baroinfopage
    }

    Button {
        id: button3
        x: 106
        y: 520
        text: qsTr("相对高度复位")
        font.bold: true
        font.pointSize: 20
        onClicked:
        {
            myclassExposeByRegType.sendCMD("27", "808080800800", "0000000000000000");
        }
    }

    Text {
        id: labelHeight
        x: 333
        y: 525
        width: 182
        height: 40
        text: qsTr("当前相对高度：")
        font.bold: true
        font.pointSize: 20
    }

    Text {
        id: labelHeight1
        x: 713
        y: 524
        width: 154
        height: 40
        text: qsTr("当前气压值：")
        font.pointSize: 20
        font.bold: true
    }

    Text {
        id: labelHeight2
        x: 1053
        y: 524
        width: 119
        height: 40
        text: qsTr("当前温度：")
        font.pointSize: 20
        font.bold: true
    }

    Text {
        id: theight
        x: 516
        y: 526
        width: 64
        height: 31
        text: qsTr("0cm")
        font.pointSize: 20
        font.bold: true
    }

    Text {
        id: tpressure
        x: 873
        y: 525
        width: 64
        height: 31
        text: qsTr("0Pa")
        font.bold: true
        font.pointSize: 20
    }

    Text {
        id: ttemperature
        x: 1178
        y: 525
        width: 64
        height: 31
        text: qsTr("0℃")
        font.pointSize: 20
        font.bold: true
    }

    Timer {
        interval: 500
        repeat: true
        triggeredOnStart: false
        running: true
        onTriggered: {
            theight.text = myclassExposeByRegType.getHeight() + "cm";
            tpressure.text = myclassExposeByRegType.getPressure() + "Pa";
            ttemperature.text = myclassExposeByRegType.getTemperature() + "℃";
        }
    }

}

