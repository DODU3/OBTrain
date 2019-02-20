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
        text: qsTr("使用教程")
        anchors.verticalCenterOffset: -164
        anchors.horizontalCenterOffset: -94
        height: 26
        width: 86
        anchors.centerIn: parent
        font.pixelSize: 24
    }


    Button {
        id: button
        x: 300
        y: 300
        text: qsTr("OB图传")
        font.pixelSize: 18
        MouseArea{
            id:mouseAreaVideo
            visible: true
            anchors.rightMargin: -30
            anchors.bottomMargin: 0
            anchors.leftMargin: 30
            anchors.topMargin: 0
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
        x: 650
        y: 300
        text: qsTr("人脸识别")
        font.pixelSize: 18
        MouseArea{
            id:mouseAreaUseFaceDetect
            anchors.fill: parent
            onPressed: {
                page2.visible = true;
                page2.stack = stack;
                stack.push(page2);
            }
        }
    }

    OBVideo {
        id: page1
        visible: false
        stack: stack
    }
    FaceDetect {
        id: page2
        visible: false
        stack: stack
    }

}




/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
