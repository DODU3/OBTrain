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

//    MyVlcPlayer{
//        id:myvlcplayer
//        x: 200
//        y: 100
//        height: 728
//        width: 1360
//    }

    Button {
        height: 32
        width: 120
        text: "<-"
        anchors.left: parent.left
        anchors.top: parent.top
        onClicked: stack.pop()
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
        onClicked:
        {
            page1.visible = true;
            page1.stack = stack;
            stack.push(page1);
        }
//        MouseArea{
//            id:mouseArea
//            anchors.fill: parent
//            onPressed: {
//                page1.visible = true;
//                page1.stack = stack;
//                stack.push(page1);
//            }
//        }
    }

    Button {
        id: button1
        x: 64
        y: 400
        width: 100
        height: 43
        text: qsTr("连接")
    }
    Button {
        id: button2
        x: 64
        y: 400
        text: qsTr("视频")

        onClicked:
        {
            page2.visible = true;
            page2.stack = stack;
            stack.push(page2);
        }

//        MouseArea{
//            id:mouseVideo1Area
//            anchors.rightMargin: 0
//            anchors.bottomMargin: 19
//            anchors.leftMargin: 0
//            anchors.topMargin: -19
//            anchors.fill: parent
//            onPressed: {
//                page2.visible = true;
//                page2.stack = stack;
//                stack.push(page2);
//            }
//        }
    }
    Button {
        id: button3
        x: 64
        y: 500
        text: qsTr("人脸识别 ")

        onClicked:
        {
            mySystemOpenReg.openFaceDBW();
        }

//        MouseArea{
//            id:mouseProjectArea
//            anchors.fill: parent
//            onPressed: {
//                mySystemOpenReg.openFaceDBW()
//            }
//        }
    }

    ComboBox {
        id: comboBox
        x: 64
        y: 320
        width: 100
        height: 40
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
    UseGuide {
        id: page3
        visible: false
        stack: stack
    }

    Button {
        id: button4
        x: 64
        y: 250
        text: qsTr("使用教程")

        onClicked:
        {
            page3.visible = true;
            page3.stack = stack;
            stack.push(page3);
        }

//        MouseArea{
//            id:mouseAreaUseGuide
//            anchors.fill: parent
//            onPressed: {
//                page3.visible = true;
//                page3.stack = stack;
//                stack.push(page3);
//            }
//        }
    }

    Button {
        id: button5
        x: 64
        y: 450
        text: qsTr("人脸检测")
    }

}

