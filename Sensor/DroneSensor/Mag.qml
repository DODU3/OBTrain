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
    width: 1280
    height: 740

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

    ComboBox {
        id: comboBox
        objectName: "portComboBox"
        x: 110
        y: 78

        model:comboModel.comboList

    }

    QmlToggleButton{
        id: qmlToggleButton
        anchors.centerIn: parent
        height: 26
        anchors.verticalCenterOffset: -272
        anchors.horizontalCenterOffset: -274
        width: 80
        leftString: qsTr("打开")
        rightString: qsTr("关闭")
//        onToggleLeft: label.text = qmlToggleButton.leftString
//        onToggleRight: label.text = qmlToggleButton.rightString


    }

    Button {
        id: button7
        x: 544
        y: 78
        text: qsTr("配置无线地址")

        MouseArea{
            id:mouseSetArea
            anchors.fill: parent
            onPressed: {
//                rfsetpage.setX(350);
//                rfsetpage.setY(200);
                rfsetpage.show();
            }
        }
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
        x: 164
        y: 196
        text: qsTr("教学资料")
        MouseArea{
            id:mouseArea
            anchors.fill: parent
            onPressed: {
                maginfopage.show();
//                page11.visible = true;
//                page11.stack = stack;
//                stack.push(page11);
            }
        }
    }


    Button {
        id: button3
        x: 164
        y: 277
        text: qsTr("实时数据")

        MouseArea{
            id:mouseFlowArea
            anchors.fill: parent
            onPressed: {
                magdatapage.show();
//                page12.visible = true;
//                page12.stack = stack;
//                stack.push(page12);

            }
        }
    }

    Button {
        id: button4
        x: 164
        y: 350
        text: qsTr("数据保存与应用")

        MouseArea{
            id:mouseVideoArea
            anchors.fill: parent
            onPressed: {
                magdataapplicatepage.show();
//                page13.visible = true;
//                page13.stack = stack;
//                stack.push(page13);
//                mySystemOpenReg.openProject()
            }
        }
    }

    Button {
        id: button5
        x: 164
        y: 431
        text: qsTr("基本收发")

        MouseArea{
            id:mouseVideo1Area
            anchors.fill: parent
            onPressed: {
                magbasicrecandsendpage.show();
//                page14.visible = true;
//                page14.stack = stack;
//                stack.push(page14);
            }
        }
    }

    Button {
        id: button6
        x: 164
        y: 510
        text: qsTr("实验操作")

        MouseArea{
            id:mousecontrolArea
            anchors.fill: parent
            onPressed: {
                magcongrolPage.show();
//                page14.visible = true;
//                page14.stack = stack;
//                stack.push(page14);
            }
        }
    }

    Button {
        id: button2
        x: 164
        y: 598
        text: qsTr("工程实例")

        MouseArea{
            id:mouseProjectArea
            anchors.fill: parent
            onPressed: {
//                mySystemOpenReg.openProject()

                magprojectdeveloppage.active;
                magprojectdeveloppage.show();
                //magprojectdeveloppage.x;
            }
        }
    }

    Connections {
        target: qmlToggleButton
        onToggleLeft: {
            myclassExposeByRegType.closePort();

        }

    }

    Connections {
        target: qmlToggleButton
        onToggleRight: {
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
        x: 300
        y: 200
    }


    CharViewPage
    {
        id:charview
        x:700
        y:200
    }


    Component.onCompleted: {

//        myclassExposeByRegType.setMagCornerStr("0° 北")
        myclassExposeByRegType.getPortInfo();
        comboModel.setComboList(myclassExposeByRegType.receivePort());

    }

    MagControlPage{
        id:magcongrolPage
    }

    MagBasicRecAndSendPage{
        id:magbasicrecandsendpage
    }

    MagDataApplicatePage{
        id:magdataapplicatepage
    }

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
}
