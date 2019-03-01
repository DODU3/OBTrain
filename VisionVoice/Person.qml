import QtQuick 2.9
import QtQuick.Controls 2.2
import ".."
import "./Detection"
import "../Component"

import XVideo 1.0

Page {
    id: page


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

    Label{
        id: label
        text: qsTr("计算机视觉中的传统机器学习和卷积神经网络算法")
        anchors.verticalCenterOffset: -524
        anchors.horizontalCenterOffset: -579
        height: 32
        width: 466
        anchors.centerIn: parent
        font.pixelSize: 20

    }

    Button {
        id: button
        x: 4
        y: 114
        text: qsTr("AI简介与机器学习")
//        anchors.right: image.left
//        anchors.rightMargin: 706

        onClicked:
        {
            page1.visible = true;
            page1.stack = stack;
            stack.push(page1);
        }

//        MouseArea{
//            id:mouseArea1
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
        x: 0
        y: 339
        width: 137
        height: 40
        text: qsTr("人体检测例程")
//        anchors.right: image.left
//        anchors.rightMargin: 685

        onClicked:
        {
            page10.visible = true;
            page10.stack = stack;
            stack.push(page10);
        }

//        MouseArea{
//            id:mouseArea2
//            anchors.fill: parent
//            onPressed: {
//                page10.visible = true;
//                page10.stack = stack;
//                stack.push(page10);
//            }
//        }
    }

    Button {
        id: button2
        x: 0
        y: 235
        width: 137
        height: 40
        text: qsTr("视觉跟踪例程")
//        anchors.right: image.left
//        anchors.rightMargin: 685

        onClicked:
        {
            page10.visible = true;
            page10.stack = stack;
            stack.push(page10);
        }

//        MouseArea{
//            id:mouseArea3
//            anchors.fill: parent
//            onPressed: {
//                page10.visible = true;
//                page10.stack = stack;
//                stack.push(page10);
//            }
//        }
    }

    Button {
        id: button3
        x: 0
        y: 432
        width: 137
        height: 40
        text: qsTr("姿态识别例程")
//        anchors.right: image.left
//        anchors.rightMargin: 685
        MouseArea{
            id:mouseArea4
            anchors.fill: parent
            onPressed: {
                page10.visible = true;
                page10.stack = stack;
                stack.push(page10);
            }
        }
    }

    Image {
        id: image
        x: 122
        y: 38
        width: 436
        height: 373
//        anchors.horizontalCenterOffset: 95
//        anchors.horizontalCenter: parent.horizontalCenter
        fillMode: Image.PreserveAspectFit
        source: "images/ML.jpg"
    }

    Introduction {
        id: page1
        visible: false
        stack: stack
    }

    Vision_Examples{
        id: page10
        visible: false
        stack: stack
    }

    QmlVideo{
        id:qmlVideo
        x: 560
        y: 29
    }

//    XVideo{
//        id:xvideo
//        width: 360;
//        height: 200;
////        strVideoPath: "rtsp://192.168.2.10";//香港电视台直播流
//    }



//    StackView
//    {
//        width: 360;
//        height: 640;
//        anchors.verticalCenterOffset: -59
//        anchors.horizontalCenterOffset: 484
//        anchors.centerIn: parent;
//        id:stack_view;
//        initialItem: Rectangle{
//        }
//    }
}




/*##^## Designer {
    D{i:12;invisible:true}
}
 ##^##*/
