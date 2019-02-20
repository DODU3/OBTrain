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
        text: qsTr("视觉跟踪算法使用教程")
        anchors.leftMargin: 50
        anchors.top: parent.top
        anchors.topMargin: 60
        anchors.horizontalCenter: parent.horizontalCenter
        height: 26
        font.pixelSize: 20
    }

    Image {
        id: tracking_teaching1
        y: 119
        width: 624
        height: 430
        anchors.left: parent.left
        anchors.leftMargin: 50
        sourceSize.height: 0
        sourceSize.width: 0
        fillMode: Image.PreserveAspectFit
        source: "../images/tracking_teaching1.png"
    }

    Image {
        id: tracking_teaching2
        x: 363
        y: 119
        width: 624
        height: 430
        anchors.right: parent.right
        anchors.rightMargin: 50
        sourceSize.height: 0
        sourceSize.width: 0
        fillMode: Image.PreserveAspectFit
        source: "../images/tracking_teaching2.png"
    }

    TextEdit {
        id: textEdit
        width: 170
        height: 79
        text: qsTr("1：连接图传并出现图像之后，使用鼠标选择跟踪目标按下键
盘“t”键开始跟踪。")
        anchors.top: tracking_teaching1.bottom
        anchors.topMargin: 15
        anchors.left: tracking_teaching1.left
        anchors.leftMargin: 0
        font.pixelSize: 18
    }

    TextEdit {
        id: textEdit1
        width: 170
        height: 49
        text: qsTr("2：缓慢移动图传，观察跟踪效果。停止跟踪时，只需要按下
“s”键。")
        anchors.top: tracking_teaching2.bottom
        anchors.topMargin: 15
        anchors.left: tracking_teaching2.left
        anchors.leftMargin: 0
        font.pixelSize: 18
    }

    Button {
        id: person_detection
        x: 568
        y: 647
        width: 106
        height: 40
        text: qsTr("返回")
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter

        MouseArea{
            id:back_examples
            x: 568
            y: 647
            width: 106
            height: 40
            anchors.horizontalCenterOffset: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.horizontalCenter: parent.horizontalCenter
            onPressed: {
                stack.pop()
            }
        }
    }
}












































/*##^## Designer {
    D{i:0;autoSize:true;height:720;width:1280}D{i:3;anchors_x:123;anchors_y:239}D{i:4;anchors_x:252;anchors_y:86}
D{i:5;anchors_x:123;anchors_y:563}D{i:6;anchors_x:123;anchors_y:563}
}
 ##^##*/
