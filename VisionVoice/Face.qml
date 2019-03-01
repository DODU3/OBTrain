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

    QmlVideo{
        id:qmlVideo
        x: 373
        y: 98
    }

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
        y: 150
        width: 132
        height: 41
        text: qsTr("简介")
        font.bold: true
        font.pointSize: 22
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
        id: button3
        x: 699
        y: 862
        text: qsTr("人脸识别 ")
        font.bold: true
        font.pointSize: 22

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
        y: 285
        text: qsTr("使用教程")
        font.bold: true
        font.pointSize: 22

        onClicked:
        {
            page3.visible = true;
            page3.stack = stack;
            stack.push(page3);
        }
    }

    Button {
        id: button5
        x: 475
        y: 862
        text: qsTr("人脸检测")
        font.bold: true
        font.pointSize: 22
        onClicked:
        {

        }
    }

}

