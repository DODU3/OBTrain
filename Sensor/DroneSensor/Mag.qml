import QtQuick 2.9
import QtQuick.Controls 2.2

import QtMultimedia 5.4

import ".."
import "../../Component"
import "./PresentPage"


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

    Label{
        id: label
        text: qsTr("磁力计")
        anchors.verticalCenterOffset: -252
        anchors.horizontalCenterOffset: 0
        height: 80
        width: 240
        anchors.centerIn: parent
        font.pixelSize: 20
    }

    ComboBox {
        id: comboBox
        objectName: "portComboBox"
        x: 144
        y: 166

        model:comboModel.comboList

    }

    QmlToggleButton{
        id: qmlToggleButton
        anchors.centerIn: parent
        height: 26
        anchors.verticalCenterOffset: -184
        anchors.horizontalCenterOffset: -274
        width: 80
        leftString: qsTr("打开")
        rightString: qsTr("关闭")
        onToggleLeft: label.text = qmlToggleButton.leftString
        onToggleRight: label.text = qmlToggleButton.rightString


    }

    TextEdit {
        id: textEdit
        x: 749
        y: 166
        width: 441
        height: 40
        text:myclassExposeByRegType.receivedata
        font.pixelSize: 12

    }

    MyClassType
    {
        id:myclassExposeByRegType
    }

    MySystemOpen
    {
        id:mySystemOpenReg
    }



    Button {
        id: button1
        x: 164
        y: 239
        text: qsTr("简介")
        MouseArea{
            id:mouseArea
            anchors.fill: parent
            onPressed: {
                page11.visible = true;
                page11.stack = stack;
                stack.push(page11);
            }
        }
    }



    Button {
        id: button3
        x: 164
        y: 327
        text: qsTr("流程图")

        MouseArea{
            id:mouseFlowArea
            anchors.fill: parent
            onPressed: {
                page12.visible = true;
                page12.stack = stack;
                stack.push(page12);

            }
        }
    }

    Button {
        id: button4
        x: 164
        y: 416
        text: qsTr("视频教学")

        MouseArea{
            id:mouseVideoArea
            anchors.fill: parent
            onPressed: {
                page13.visible = true;
                page13.stack = stack;
                stack.push(page13);
//                mySystemOpenReg.openProject()
            }
        }
    }

    Button {
        id: button5
        x: 164
        y: 513
        text: qsTr("校准视频")

        MouseArea{
            id:mouseVideo1Area
            anchors.fill: parent
            onPressed: {
                page14.visible = true;
                page14.stack = stack;
                stack.push(page14);
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
                mySystemOpenReg.openProject()
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

    Text {
        id: element
        x: 475
        y: 166
        width: 80
        height: 40
        text: myclassExposeByRegType.receiveMagCorner
        font.pixelSize: 34
    }

    Button {
        id: button
        x: 387
        y: 598
        text: qsTr("校准")
        MouseArea{
            id:mouseVerifyArea
            anchors.fill: parent
            onPressed: {

                myclassExposeByRegType.sendto("ff5580808080080002000000000000000000");
            }
        }
    }

    Button {
        id: button10
        x: 632
        y: 598
        text: qsTr("复位")

        MouseArea{
            id:mouseResetArea
            anchors.fill: parent
            onPressed: {
                slider.value = 0;
                slider1.value = 0;
                myclassExposeByRegType.sendto("ff5580808080080027000000000000000000");
            }
        }
    }

    Slider {
        id: slider
        x: 337
        y: 487
        stepSize: 1
        to: 360
        value: 0.0
        onValueChanged: {
            myclassExposeByRegType.setMagCorner(value,slider1.value);
        }
    }

    Slider {
        id: slider1
        x: 582
        y: 487
        stepSize: 1
        to: 90
        from: -90
        value: 0.0
        onValueChanged: {
            myclassExposeByRegType.setMagCorner(slider.value,value);

        }
    }

    Text {
        id: element2
        x: 346
        y: 463
        width: 60
        height: 18
        text: qsTr("Z轴控制")
        font.pixelSize: 12
    }

    Text {
        id: element3
        x: 582
        y: 463
        width: 57
        height: 18
        text: qsTr("X轴控制")
        font.pixelSize: 12
    }


    Component.onCompleted: {

        myclassExposeByRegType.setMagCornerStr("0° 北")
        myclassExposeByRegType.getPortInfo();
        comboModel.setComboList(myclassExposeByRegType.receivePort());

    }

    MagPresent {
        id: page11
        visible: false
        stack: stack
    }

    MagFlow{
        id: page12
        visible: false
        stack: stack
    }

    VideoPlayer {
        id: page13
        visible: false
        stack: stack
    }

    VideoPlayerTest{
        id: page14
        visible: false
        stack: stack
    }
}
