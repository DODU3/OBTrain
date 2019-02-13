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
            x: 163
            y: 285
            width: 150
            height: 150
            text: qsTr("模型构建")

            background: Image {
                source: "images/ModelGenerate.png"
            }

            onClicked: {
                page2.visible = true;
                page2.stack = stack;
                stack.push(page2)
            }
        }

        Button {
            id: button1
            x: 565
            y: 285
            width: 150
            height: 150
            text: qsTr("数据训练集")

            background: Image {
                source: "images/DataTrain.png"

            }

            onClicked: {
                page3.visible = true;
                page3.stack = stack;
                stack.push(page3)
            }
        }

        Button {
            id: button5
            x: 950
            y: 285
            width: 150
            height: 150
            text: qsTr("训练验证")

            background: Image {
                source: "images/TrainVerify.png"
            }

            onClicked: {
                page4.visible = true;
                page4.stack = stack;
                stack.push(page4)
            }
        }


    }

    ModelGenerate{
        id: page2
        visible: false
    }

    DataTrain{
        id: page3
        visible: false
    }


    TrainVerify {
        id: page4
        visible: false
    }

}




