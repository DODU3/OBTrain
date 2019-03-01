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

    Button {
        height: 32
        width: 120
        text: "<-"
        anchors.left: parent.left
        anchors.top: parent.top
        onClicked: stack.pop()
    }

    Button {
        id: button
        x: 53
        y: 116
        width: 226
        height: 41
        font.bold: true
        font.pointSize: 22
        text: qsTr("简介")
//        anchors.right: image.left
//        anchors.rightMargin: 706

        onClicked:
        {
            page1.visible = true;
            page1.stack = stack;
            stack.push(page1);
        }
    }

    Button {
        id: button1
        x: 58
        y: 317
        width: 226
        height: 40
        font.bold: true
        font.pointSize: 22
        text: qsTr("人体检测例程")
//        anchors.right: image.left
//        anchors.rightMargin: 685

        onClicked:
        {
            page10.visible = true;
            page10.stack = stack;
            stack.push(page10);
        }

    }

    Button {
        id: button2
        x: 53
        y: 221
        width: 231
        height: 40
        font.bold: true
        font.pointSize: 22
        text: qsTr("视觉跟踪例程")
//        anchors.right: image.left
//        anchors.rightMargin: 685

        onClicked:
        {
            page10.visible = true;
            page10.stack = stack;
            stack.push(page10);
        }

    }

    Button {
        id: button3
        x: 53
        y: 428
        width: 226
        height: 40
        font.bold: true
        font.pointSize: 22
        text: qsTr("姿态识别例程")

        onClicked:
        {
            page10.visible = true;
            page10.stack = stack;
            stack.push(page10);
        }
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
        x: 373
        y: 98
    }

    Button {
        id: button4
        x: 492
        y: 845
        text: qsTr("人体检测")
        font.bold: true
        font.pointSize: 22
    }

    Button {
        id: button5
        x: 715
        y: 845
        text: qsTr("视觉跟踪")
        font.bold: true
        font.pointSize: 22
    }

    Button {
        id: button6
        x: 974
        y: 845
        font.bold: true
        font.pointSize: 22
        text: qsTr("姿态识别")
    }

}
