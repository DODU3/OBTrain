import QtQuick 2.9
import QtQuick.Controls 2.2
import ".."

Page {
    width: 1920
    height: 1080

    property StackView stack: null

    background: Image {
        source: "../../images/background.png"
    }

    Button {
        height: 32
        width: 120
        text: "<-"
        anchors.left: parent.left
        anchors.top: parent.top
        onClicked: stack.pop()
    }

    Button {
        x: 353
        y: 112
        width: 150
        height: 150
        text: qsTr("摄像图传")

        background: Image {
            source: "images/StreamTrans.png"
        }

        onClicked: {
            page2.visible = true;
            page2.stack = stack;
            stack.push(page2)
        }
    }

    Button {
        id: button1
        x: 755
        y: 112
        width: 150
        height: 150
        text: qsTr("双目摄像")

        onClicked: {
            page3.visible = true;
            page3.stack = stack;
            stack.push(page3)
        }

        background: Image {
            source: "images/Binocular.png"
        }
    }

    Button {
        id: button5
        x: 353
        y: 407
        width: 150
        height: 150
        text: qsTr("语音识别")

        onClicked: {
            page4.visible = true;
            page4.stack = stack;
            stack.push(page4)
        }

        background: Image {
            source: "images/VoiceVerify.png"
        }
    }



    Button {
        id: button3
        x: 755
        y: 407
        width: 150
        height: 150
        text: qsTr("手纹识别")

        onClicked: {
            page5.visible = true;
            page5.stack = stack;
            stack.push(page5)
        }

        background: Image {
            source: "images/HandPrint.png"
        }
    }


    StreamTrans {
        id: page2
        visible: false
        stack: stack
    }

    Binocular {
        id: page3
        visible: false
        stack: stack
    }

    VoiceVerify {
        id: page4
        visible: false
        stack: stack
    }

    HandPrint {
        id: page5
        visible: false
        stack: stack
    }


}

