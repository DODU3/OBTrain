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
        x: 313
        y: 134
        width: 250
        height: 250
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
        x: 827
        y: 134
        width: 250
        height: 250
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
        x: 1332
        y: 134
        width: 250
        height: 250
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
        x: 1332
        y: 532
        width: 250
        height: 250
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
        x: 313
        y: 532
        width: 250
        height: 250
        text: qsTr("电子罗盘")


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
        x: 827
        y: 532
        width: 250
        height: 250
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




    GPSGuide {
        id: page2
        visible: false
        stack: stack
    }

    GyroGuide {
        id: page3
        visible: false
        stack: stack
    }

    BarometersGuide {
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

    MagGuide {
        id: page8
        visible: false
        stack: stack
    }

}

