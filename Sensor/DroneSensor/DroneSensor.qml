import QtQuick 2.9
import QtQuick.Controls 2.2
import ".."

import RegisterMyType 1.0

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
        x: 869
        y: 572
        width: 250
        height: 250
        text: qsTr("GPS模组")
        display: AbstractButton.IconOnly

        background: Image {
            source: "images/GPS.png"
        }

        onClicked: {
            page2.visible = true;
            page2.stack = stack;
            stack.push(page2)
            myclassExposeByRegType.setCurrentPage(3);//打开GPS模组界面
        }
    }

    Button {
        id: button1
        x: 631
        y: 134
        width: 250
        height: 250
        text: qsTr("陀螺仪模组")
        display: AbstractButton.IconOnly

        onClicked: {
            page3.visible = true;
            page3.stack = stack;
            stack.push(page3)
            myclassExposeByRegType.setCurrentPage(2);//打开陀螺仪模组界面
        }

        background: Image {
            source: "images/Gyro.png"
        }
    }

    Button {
        id: button5
        x: 387
        y: 572
        width: 250
        height: 250
        text: qsTr("气压计模组")
        display: AbstractButton.IconOnly

        onClicked: {
            page4.visible = true;
            page4.stack = stack;
            stack.push(page4)
            myclassExposeByRegType.setCurrentPage(4);//打开气压计模组界面
        }

        background: Image {
            source: "images/Barometers.png"

        }
    }


    Button {
        id: button3
        x: 1566
        y: 147
        width: 250
        height: 250
        text: qsTr("超声波模组")
        display: AbstractButton.IconOnly

        onClicked: {
            page5.visible = true;
            page5.stack = stack;
            stack.push(page5)
            myclassExposeByRegType.setCurrentPage(5);//打开超声波模组界面
        }

        background: Image {
            source: "images/Ultrasonic.png"
        }
    }

    Button {
        id: button
        x: 1113
        y: 147
        width: 250
        height: 250
        text: qsTr("电子罗盘模组")
        display: AbstractButton.IconOnly


        onClicked: {
            page8.visible = true;
            page8.stack = stack;
            stack.push(page8)
            myclassExposeByRegType.setCurrentPage(6);//打开电子罗盘模组界面
        }

        background: Image {
            source: "images/mag.png"
        }
    }

    Button {
        id: button4
        x: 145
        y: 147
        width: 250
        height: 250
        text: qsTr("加速度计模组")
        display: AbstractButton.IconOnly
        transformOrigin: Item.Center

        onClicked: {
            page6.visible = true;
            page6.stack = stack;
            stack.push(page6)
            myclassExposeByRegType.setCurrentPage(1);//打开加速度计模组界面
        }

        background: Image {
            source: "images/OpticalFlow.png"
        }
    }


    Button {
        id: button6
        x: 1372
        y: 559
        width: 250
        height: 250
        text: qsTr("光流模组")
        display: AbstractButton.IconOnly
        background: Image {
            source: "images/Infrared.png"
        }
        transformOrigin: Item.Center

        onClicked: {
            page7.visible = true;
            page7.stack = stack;
            stack.push(page7)
            myclassExposeByRegType.setCurrentPage(11);//打开光流模组界面
        }
    }

    MyClassType
    {
        id:myclassExposeByRegType
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

    Acc {
        id: page6
        visible: false
        stack: stack
    }

    Mag {
        id: page8
        visible: false
        stack: stack
    }

    OpticalFlow {
        id: page7
        visible: false
        stack: stack
    }


    Text {
        id: element
        x: 964
        y: 841
        text: qsTr("GPS")
        font.bold: true
        font.pixelSize: 40
    }

    Text {
        id: element1
        x: 696
        y: 403
        text: qsTr("陀螺仪")
        font.pixelSize: 40
        font.bold: true
    }

    Text {
        id: element2
        x: 452
        y: 841
        text: qsTr("气压计")
        font.pixelSize: 40
        font.bold: true
    }

    Text {
        id: element3
        x: 1457
        y: 828
        text: qsTr("光流")
        font.pixelSize: 40
        font.bold: true
    }

    Text {
        id: element4
        x: 1178
        y: 403
        text: qsTr("磁力计")
        font.pixelSize: 40
        font.bold: true
    }

    Text {
        id: element5
        x: 190
        y: 403
        text: qsTr("加速度计")
        font.pixelSize: 40
        font.bold: true
    }

    Text {
        id: element6
        x: 1640
        y: 403
        text: qsTr("超声波")
        font.pixelSize: 40
        font.bold: true
    }

}

