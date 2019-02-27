import QtQuick 2.9
import QtQuick.Controls 2.2

import QtMultimedia 5.4

import ".."
import "../../Component"
import "./PresentPage"
import "./MagPage"


import RegisterMyType 1.0
import RegisterSystemOpen 1.0



Page {

    property StackView stack: null
    width: 1920
    height: 1080

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
//        model: portlistmodel

//        pressed: true
//        down: true

//        MouseArea{
//            onPressed: {
//                console.info("aa");
//                myclassExposeByRegType.getPortInfo();
//                comboModel.setComboList(myclassExposeByRegType.receivePort());
//            }
//        }
        onActivated: {
            console.info("aa");
        }

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
//        leftString: qsTr("打开")
//        rightString: qsTr("关闭")

//        onToggleLeft: label.text = qmlToggleButton.leftString
//        onToggleRight: label.text = qmlToggleButton.rightString
//        onToggleLeft: {
//            timerSend.start();
//        }

//        onToggleRight: {
//            timerSend.stop();
//        }


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
//            rfsetpage.flags.Dialog;

        }

//        MouseArea{
//            id:mouseSetArea
//            anchors.rightMargin: 0
//            anchors.bottomMargin: 0
//            anchors.leftMargin: 0
//            anchors.topMargin: 0
//            anchors.fill: parent
//            onPressed: {
//                rfsetpage.show();
//            }
//        }
    }


    MyClassType
    {
        id:myclassExposeByRegType
    }

//    MySystemOpen
//    {
//        id:mySystemOpenReg
//    }



    Button {
        id: button1
        x: 653
        y: 50
        text: qsTr("教学资料")
        font.bold: true
        font.pointSize: 20

        onClicked:
        {
            maginfopage.show();
        }

//        MouseArea{
//                    id:mouseArea
//                    anchors.rightMargin: -1
//                    anchors.bottomMargin: -2
//                    anchors.leftMargin: 1
//                    anchors.topMargin: 2
//                    anchors.fill: parent
//                    onPressed: {
//                maginfopage.show();
////                page11.visible = true;
////                page11.stack = stack;
////                stack.push(page11);
//            }
//        }
    }


//    Button {
//        id: button3
//        x: 164
//        y: 277
//        text: qsTr("实时数据")

//        MouseArea{
//            id:mouseFlowArea
//            anchors.fill: parent
//            onPressed: {
//                magdatapage.show();
////                page12.visible = true;
////                page12.stack = stack;
////                stack.push(page12);

//            }
//        }
//    }

//    Button {
//        id: button4
//        x: 164
//        y: 350
//        text: qsTr("数据保存与应用")

//        MouseArea{
//            id:mouseVideoArea
//            anchors.fill: parent
//            onPressed: {
//                magdataapplicatepage.show();
////                page13.visible = true;
////                page13.stack = stack;
////                stack.push(page13);
////                mySystemOpenReg.openProject()
//            }
//        }
//    }

//    Button {
//        id: button5
//        x: 164
//        y: 431
//        text: qsTr("基本收发")

//        MouseArea{
//            id:mouseVideo1Area
//            anchors.fill: parent
//            onPressed: {
//                magbasicrecandsendpage.show();
////                page14.visible = true;
////                page14.stack = stack;
////                stack.push(page14);
//            }
//        }
//    }

//    Button {
//        id: button6
//        x: 164
//        y: 510
//        text: qsTr("实验操作")

//        MouseArea{
//            id:mousecontrolArea
//            anchors.fill: parent
//            onPressed: {
//                magcongrolPage.show();
////                page14.visible = true;
////                page14.stack = stack;
////                stack.push(page14);
//            }
//        }
//    }

    Button {
        id: button2
        x: 821
        y: 48
        text: qsTr("工程实例")
        font.bold: true
        font.pointSize: 20

        onClicked:
        {
            magprojectdeveloppage.active;
            magprojectdeveloppage.show();
        }

//        MouseArea{
//            id:mouseProjectArea
//            anchors.rightMargin: 0
//            anchors.bottomMargin: 0
//            anchors.leftMargin: 0
//            anchors.topMargin: 0
//            anchors.fill: parent
//            onPressed: {
////                mySystemOpenReg.openProject()

//                magprojectdeveloppage.active;
//                magprojectdeveloppage.show();
//                //magprojectdeveloppage.x;
//            }
//        }
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


    CompassUi
    {
        id: compassui
        x: 146
        y: 155
        width: 400
        height: 400
    }


    CharViewPage
    {
        id:charview
        x:550
        y:155
        visible: true
    }

    Rectangle {
        x:1262
        y:594
        width: 402
        height: 400
        color: "#00000000"
        border.width: 1

        MagBasicRecAndSendPage{
            id:magbasicrecandsendpage
            x:2
            y:2
            width: 400
            height: 400
        }
    }


    Rectangle {
        x:1263
        y:155
        width: 402
        height: 400
        color: "#00000000"
        border.width: 1

        MagDataApplicatePage{
            id:magdataapplicatepage
            x:2
            y:2
            width: 400
            height: 400
        }
    }

    MagControlPage{
        id:magcongrolPage

        x:146
        y:595
        width: 400
        height: 400
    }


    Component.onCompleted: {

//        myclassExposeByRegType.setMagCornerStr("0° 北")
        myclassExposeByRegType.getPortInfo();
        comboModel.setComboList(myclassExposeByRegType.receivePort());
//        portlistmodel.append({"portnam" : "hello"});
//        portlistmodel.append({"portnam" : "hel2lo"});
//        portlistmodel.append("zark");

    }

//    ListModel {
//        id: portlistmodel
//        ListElement {
//            portnam: "COM1"
//        }
//    }

//    ListView {
//        anchors.fill: parent
//        model: portlistmodel
//        delegate: Row {
//            Text { text: portname}
//        }
//    }

    MagDataPage{
        id:magdatapage
    }

    MagInfoPage{
        id:maginfopage
    }

    RFSetPage{
        id:rfsetpage
    }

    MagProjectDevelopPage{
        id:magprojectdeveloppage
    }

//    Timer {

//        id:timerSend

//        interval: 50
////        running: true
//        repeat: true

//        onTriggered: {
//            if(true === myclassExposeByRegType.getserialOpenFlag()){
//                myclassExposeByRegType.sendto("ff5580808080080000000000000000000000");

//            }
//        }
//    }
}
