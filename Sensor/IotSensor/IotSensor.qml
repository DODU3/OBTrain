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
        x: 154
        y: 100
        width: 150
        height: 150
        text: qsTr("OBOX网关")

        background: Image {
            source: "images/OBOX.png"
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
        y: 100
        width: 150
        height: 150
        text: qsTr("触摸面板")

        onClicked: {
            page3.visible = true;
            page3.stack = stack;
            stack.push(page3)
        }

        background: Image {
            source: "images/Pannel.png"
        }
    }

    Button {
        id: button5
        x: 969
        y: 100
        width: 150
        height: 150
        text: qsTr("人体红外")

        onClicked: {
            page4.visible = true;
            page4.stack = stack;
            stack.push(page4)
        }

        background: Image {
            source: "images/Infrared.png"
        }
    }



    Button {
        id: button3
        x: 363
        y: 403
        width: 150
        height: 150
        text: qsTr("插卡取电")

        onClicked: {
            page5.visible = true;
            page5.stack = stack;
            stack.push(page5)
        }

        background: Image {
            source: "images/Card.png"
        }
    }

    Button {
        id: button4
        x: 796
        y: 403
        width: 150
        height: 150
        text: qsTr("智能开关")
        transformOrigin: Item.Center

        onClicked: {
            page6.visible = true;
            page6.stack = stack;
            stack.push(page6)
        }

        background: Image {
            source: "images/Socket.png"

        }
    }


    Obox {
        id: page2
        visible: false
        stack: stack
    }

    Pannel {
        id: page3
        visible: false
        stack: stack
    }

    Infrared {
        id: page4
        visible: false
        stack: stack
    }

    Card {
        id: page5
        visible: false
        stack: stack
    }

    Socket {
        id: page6
        visible: false
        stack: stack
    }

}

