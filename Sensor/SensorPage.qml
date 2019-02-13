/*!
 *@file Page1.qml
 *@brief Page1
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
import QtQuick 2.8
import QtQuick.Controls 2.1
import "./DroneSensor"
import "./IotSensor"
import "./VisionVoiceSensor"
import "./RobotSensor"

Page {

    StackView {
        id: stack
        initialItem: mainView
        anchors.fill: parent


    }

    Page {
        id: mainView
        width: 1280
        height: 720


        background: Image {
            source: "../images/background.png"
        }

        Button {
            x: 348
            y: 118
            width: 150
            height: 150
            text: qsTr("无人机")

            background: Image {
                source: "images/Drone.png"

            }

            onClicked: {
                page1.visible = true;
                page1.stack = stack;
                stack.push(page1)
            }
        }

        Button {
            id: button1
            x: 786
            y: 118
            width: 150
            height: 150
            text: qsTr("物联网")

            background: Image {
                source: "images/Iot.png"
            }

            onClicked: {
                page2.visible = true;
                page2.stack = stack;
                stack.push(page2)
            }
        }

        Button {
            id: button5
            x: 348
            y: 383
            width: 150
            height: 150
            text: qsTr("机器人")

            background: Image {
                source: "images/Robot.png"
            }

            onClicked: {
                page3.visible = true;
                page3.stack = stack;
                stack.push(page3)
            }
        }

        Button {
            id: button4
            x: 786
            y: 383
            width: 150
            height: 150
            text: qsTr("视觉语音")
            transformOrigin: Item.Center

            background: Image {
                source: "images/VisionVoice.png"
            }

            onClicked: {
                page4.visible = true;
                page4.stack = stack;
                stack.push(page4)
            }
        }
    }


    DroneSensor {
        id: page1
        visible: false
    }

    IotSensor{
        id: page2
        visible: false
    }

    RobotSensor{
        id: page3
        visible: false
    }

    VisionVoiceSensor{
        id: page4
        width: 1280
        height: 720
        visible: false
    }
}









/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:4;anchors_height:150;anchors_width:150;anchors_x:98;anchors_y:52}
D{i:6;anchors_y:52}D{i:8;anchors_x:98;anchors_y:257}
}
 ##^##*/
