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
        text: qsTr("姿态人型控制")
        anchors.verticalCenterOffset: -162
        anchors.horizontalCenterOffset: 23
        height: 80
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
                page2.visible = true;
                page2.stack = stack;
                stack.push(page2);
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
        text: qsTr("姿态")
    }

    ComboBox {
        id: comboBox
        x: 64
        y: 272
    }

    PersonPresent {
        id: page2
        visible: false
        stack: stack
    }
}

