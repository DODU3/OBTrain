import QtQuick 2.9
import QtQuick.Controls 2.2
import ".."

Page {
    width: 1280
    height: 720

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
        x: 126
        y: 91
        width: 150
        height: 150
        text: qsTr("GPS")

        background: Image {
            source: "images/GPS.png"
        }

        onClicked: {
            page2.visible = true;
            page2.stack = stack;
            stack.push(page2)
        }
    }

    Button {
        id: button1
        x: 401
        y: 91
        width: 150
        height: 150
        text: qsTr("陀螺仪加速器")

        onClicked: {
            page3.visible = true;
            page3.stack = stack;
            stack.push(page3)
        }

        background: Image {
            source: "images/Gyro.png"
        }
    }

    Button {
        id: button5
        x: 704
        y: 91
        width: 150
        height: 150
        text: qsTr("气压计定高")

        onClicked: {
            page4.visible = true;
            page4.stack = stack;
            stack.push(page4)
        }

        background: Image {
            source: "images/Barometers.png"

        }
    }


    Button {
        id: button3
        x: 1001
        y: 91
        width: 150
        height: 150
        text: qsTr("超声避障")

        onClicked: {
            page5.visible = true;
            page5.stack = stack;
            stack.push(page5)
        }

        background: Image {
            source: "images/Ultrasonic.png"
        }
    }

    Button {
        id: button
        x: 220
        y: 398
        width: 200
        height: 200
        text: qsTr("磁力计")

        onClicked: {
            page8.visible = true;
            page8.stack = stack;
            stack.push(page8)
        }

        background: Image {
            source: "images/mag.png"
        }
    }

    Button {
        id: button4
        x: 565
        y: 398
        width: 150
        height: 150
        text: qsTr("光流")
        transformOrigin: Item.Center

        onClicked: {
            page6.visible = true;
            page6.stack = stack;
            stack.push(page6)
        }

        background: Image {
            source: "images/OpticalFlow.png"
        }
    }



    Button {
        id: button2
        x: 954
        y: 398
        width: 150
        height: 150
        text: qsTr("红外对位")

        onClicked: {
            page7.visible = true;
            page7.stack = stack;
            stack.push(page7)
        }

        background: Image {
            source: "images/Infrared.png"
        }
    }


    GPS {
        id: page2
        visible: false
        stack: stack
    }

    Gyro {
        id: page3
        visible: false
        stack: stack
    }

    Barometers {
        id: page4
        visible: false
        stack: stack
    }

    Ultrasonic {
        id: page5
        visible: false
        stack: stack
    }

    OpticalFlow {
        id: page6
        visible: false
        stack: stack
    }

    Infrared {
        id: page7
        visible: false
        stack: stack
    }

    Mag {
        id: page8
        visible: false
        stack: stack
    }

}

