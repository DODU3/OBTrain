import QtQuick 2.9
import QtQuick.Controls 2.2
import "../../Component"

import RegisterMyType 1.0
import RegisterSystemOpen 1.0

Page {
    id: page

    property StackView stack: null

    background: Image {
        source: "../../images/background.png"
    }

    Label{
        id: label
        x: 64
        width: 240
        text: qsTr("姿态识别算法使用教程")
        anchors.leftMargin: 50
        anchors.top: parent.top
        anchors.topMargin: 35
        anchors.horizontalCenter: parent.horizontalCenter
        height: 26
        font.pixelSize: 20
    }

    Button {
        id: person_detection
        x: 568
        y: 647
        width: 106
        height: 40
        text: qsTr("返回")
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter

        onClicked:
        {
            stack.pop()
        }

//        MouseArea{
//            id:back_examples
//            x: 568
//            y: 647
//            width: 106
//            height: 40
//            anchors.horizontalCenterOffset: 0
//            anchors.bottomMargin: 0
//            anchors.horizontalCenter: parent.horizontalCenter
//            anchors.bottom: parent.bottom
//            onPressed: {
//                stack.pop()
//            }
//        }
    }

    Image {
        id: image
        x: 233
        y: 101
        width: 814
        height: 519
        anchors.verticalCenterOffset: -15
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        fillMode: Image.PreserveAspectFit
        source: "../images/Posture.png"
    }

    TextEdit {
        id: textEdit
        x: 422
        width: 436
        height: 20
        text: qsTr("画面中做出以下五种姿态，相应的姿态名称会显示在画面中")
        anchors.top: image.bottom
        anchors.topMargin: 15
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 18
    }
}




















































/*##^## Designer {
    D{i:0;autoSize:true;height:720;width:1280}D{i:4;anchors_x:252;anchors_y:86}D{i:3;anchors_x:123;anchors_y:239}
D{i:5;anchors_x:123;anchors_y:563}D{i:6;anchors_x:123;anchors_y:634}
}
 ##^##*/
