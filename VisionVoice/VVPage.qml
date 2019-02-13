/*!
 *@file Page1.qml
 *@brief Page1
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
import QtQuick 2.8
import QtQuick.Controls 2.1


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
            x: 179
            y: 104
            width: 150
            height: 150
            text: qsTr("人脸解锁")

            background: Image {
                source: "images/FaceUnlock.png"
            }

            onClicked: {
                page1.visible = true;
                page1.stack = stack;
                stack.push(page1)
            }
        }

        Button {
            id: button1
            x: 565
            y: 104
            width: 150
            height: 150
            text: qsTr("姿态人型控制")

            background: Image {
                source: "images/PersonControl.png"

            }


            onClicked: {
                page2.visible = true;
                page2.stack = stack;
                stack.push(page2)
            }
        }

        Button {
            id: button5
            x: 876
            y: 104
            width: 150
            height: 150
            text: qsTr("语音识别播放")

            background: Image {
                source: "images/VoiceVerify.png"
            }

            onClicked: {
                page3.visible = true;
                page3.stack = stack;
                stack.push(page3)
            }
        }

        Button {
            id: button3
            x: 179
            y: 394
            width: 150
            height: 150
            text: qsTr("传感模组")

            background: Image {
                source: "images/Model.png"
            }

            onClicked: {
                page4.visible = true;
                page4.stack = stack;
                stack.push(page4)
            }
        }

        Button {
            id: button4
            x: 565
            y: 394
            width: 150
            height: 150
            text: qsTr("配件软硬接口")
            transformOrigin: Item.Center

            background: Image {
                source: "images/Interface.png"
            }

            onClicked: {
                page5.visible = true;
                page5.stack = stack;
                stack.push(page5)
            }
        }



        Button {
            id: button2
            x: 876
            y: 394
            width: 150
            height: 150
            text: qsTr("APP实现")

            background: Image {
                source: "images/APP.png"
            }

            onClicked: {
                page6.visible = true;
                page6.stack = stack;
                stack.push(page6)
            }
        }

    }

    Face {
        id: page1
        visible: false
    }

    Person {
        id: page2
        visible: false
    }

    Voice {
        id: page3
        visible: false
    }

    Model {
        id: page4
        visible: false
    }

    Interface{
        id: page5
        visible: false
    }

    APP {
        id: page6
        visible: false
    }
}

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
