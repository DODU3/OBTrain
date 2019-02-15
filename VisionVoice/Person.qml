import QtQuick 2.9
import QtQuick.Controls 2.2
import ".."
import "./Detection"

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

    Label{
        id: label
        text: qsTr("计算机视觉中的传统机器学习和卷积神经网络算法")
        anchors.verticalCenterOffset: -234
        anchors.horizontalCenterOffset: 10
        height: 32
        width: 466
        anchors.centerIn: parent
        font.pixelSize: 20

    }

    Button {
        id: button
        x: 88
        y: 178
        text: qsTr("AI简介与机器学习")
        anchors.right: image.left
        anchors.rightMargin: 12
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

    /*
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
      */

    Button {
        id: button1
        x: 88
        y: 347
        width: 119
        height: 40
        text: qsTr("人体检测例程")
        anchors.right: image.left
        anchors.rightMargin: 12
    }

    Button {
        id: button2
        x: 88
        y: 264
        width: 119
        height: 40
        text: qsTr("视觉跟踪例程")
        anchors.right: image.left
        anchors.rightMargin: 12
    }

    Button {
        id: button3
        x: 88
        y: 433
        width: 119
        height: 40
        text: qsTr("姿态识别例程")
        anchors.right: image.left
        anchors.rightMargin: 12
    }

    Image {
        id: image
        x: 219
        y: 165
        width: 382
        height: 353
        anchors.horizontalCenterOffset: 60
        anchors.horizontalCenter: parent.horizontalCenter
        fillMode: Image.PreserveAspectFit
        source: "images/ML.jpg"
    }

    Introduction {
        id: page1
        visible: false
        stack: stack
    }
}

