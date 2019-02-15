import QtQuick 2.9
import QtQuick.Controls 2.2
import ".."
import "./PresentPage"

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
        text: qsTr("识别 ")
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


}

