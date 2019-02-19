import QtQuick 2.9
import QtQuick.Controls 2.2

import QtMultimedia 5.4
import ".."
import "./PresentPage"
import "../Component"

import RegisterMyType 1.0
import RegisterSystemOpen 1.0

Page {

    property StackView stack: null

    background: Image {
        source: "../images/background.png"
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
        text: qsTr("人脸识别")
        anchors.verticalCenterOffset: -187
        anchors.horizontalCenterOffset: 0
        height: 26
        width: 240
        anchors.centerIn: parent
        font.pixelSize: 20
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
        id: button
        x: 64
        y: 186
        text: qsTr("简介")

        MouseArea{
            id:mouseArea
            anchors.fill: parent
            onPressed: {
                page1.visible = true;
                page1.stack = stack;
                stack.push(page1);
            }
        }
    }

    Button {
        id: button1
        x: 64
        y: 350
        text: qsTr("连接")
    }
    Button {
        id: button2
        x: 64
        y: 446
        text: qsTr("视频")

        MouseArea{
            id:mouseVideo1Area
            anchors.fill: parent
            onPressed: {
                page2.visible = true;
                page2.stack = stack;
                stack.push(page2);
            }
        }
    }
    Button {
        id: button3
        x: 64
        y: 542
        text: qsTr("识别 ")
        MouseArea{
            id:mouseProjectArea
            anchors.fill: parent
            onPressed: {
                mySystemOpenReg.openFaceDBW()
            }
        }
    }

    ComboBox {
        id: comboBox
        x: 64
        y: 272
    }

    FacePresent {
        id: page1
        visible: false
        stack: stack
    }
    VideoPlayerDBW {
        id: page2
        visible: false
        stack: stack
    }

}

