import QtQuick 2.9
import QtQuick.Controls 2.2

import QtMultimedia 5.4
import ".."

import RegisterMyType 1.0
import RegisterSystemOpen 1.0

Page {

    property StackView stack: null

    background: Image {
         source: "../../../images/background.png"
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
        anchors.verticalCenterOffset: -226
        anchors.horizontalCenterOffset: -61
        height: 26
        width: 86
        anchors.centerIn: parent
        font.pixelSize: 33
    }

    Text {
        id: element
        x: 85
        y: 200
        width: 555
        height: 79
        text: qsTr("OB人脸识别的本地人脸库中包含了成龙等若干明星的人脸数据，可以用来测试，

以下是如何使用人脸识别的视频教程：")

        font.pixelSize: 26
    }

    Button {
        id: button
        x: 299
        y: 305
        text: qsTr("使用教程")
        font.pixelSize: 16
    }

    Text {
        id: element1
        x: 405
        y: 318
        text: qsTr("（视频）")
        font.pixelSize: 14
    }


}








/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
