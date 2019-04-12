﻿/*!
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
        width: 1920
        height: 1080


        background: Image {
            source: "../images/background.png"
        }

        Button {
            x: 537
            y: 134
            width: 250
            height: 250
            text: qsTr("无人机")
            display: AbstractButton.IconOnly

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
            x: 1168
            y: 134
            width: 250
            height: 250
            text: qsTr("物联网")
            display: AbstractButton.IconOnly

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
            x: 537
            y: 532
            width: 250
            height: 250
            text: qsTr("机器人")
            display: AbstractButton.IconOnly

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
            x: 1168
            y: 532
            width: 250
            height: 250
            text: qsTr("视觉语音")
            display: AbstractButton.IconOnly
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

        Text {
            id: element1
            x: 610
            y: 793
            text: qsTr("机器人")
            font.pixelSize: 40
            font.bold: true
        }

        Text {
            id: element2
            x: 1218
            y: 793
            text: qsTr("视觉语音")
            font.pixelSize: 40
            font.bold: true
        }

        Text {
            id: element3
            x: 1244
            y: 410
            text: qsTr("物联网")
            font.pixelSize: 40
            font.bold: true
        }

        Text {
            id: element4
            x: 610
            y: 401
            text: qsTr("无人机")
            font.pixelSize: 40
            font.bold: true
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
        width: 1920
        height: 1080
        visible: false
    }


}

















/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:4;anchors_height:150;anchors_width:150;anchors_x:98;anchors_y:52}
D{i:6;anchors_y:52}D{i:8;anchors_x:98;anchors_y:257}
}
 ##^##*/
