import QtQuick 2.9
import QtQuick.Controls 2.2

import RegisterMyType 1.0

ApplicationWindow {
    id: rfsetpage

    x: 350
    y: 200

    width: 640
    height: 320

    title: "配置无线地址"

//    MyClassType
//    {
//        id:myclassExposeByRegType
//    }

    Label {
        id: label
        width: 104
        height: 24
        text: qsTr("地址设置：")
        anchors.centerIn: parent
        font.pixelSize: 20
        anchors.verticalCenterOffset: -78
        anchors.horizontalCenterOffset: -221
    }

    Label {
        id: label1
        x: -3
        y: -6
        width: 104
        height: 24
        text: qsTr("通道设置：")
        anchors.centerIn: parent
        font.pixelSize: 20
        anchors.horizontalCenterOffset: -221
        anchors.verticalCenterOffset: -40
    }

    Label {
        id: label2
        x: 8
        y: 6
        width: 56
        height: 24
        text: qsTr("字节1")
        anchors.centerIn: parent
        font.pixelSize: 15
        anchors.horizontalCenterOffset: -128
        anchors.verticalCenterOffset: -111
    }

    Label {
        id: label3
        x: 4
        y: 10
        width: 56
        height: 24
        text: qsTr("字节2")
        anchors.centerIn: parent
        font.pixelSize: 15
        anchors.verticalCenterOffset: -111
        anchors.horizontalCenterOffset: -35
    }

    Label {
        id: label4
        x: -2
        y: 2
        width: 56
        height: 24
        text: qsTr("字节3")
        anchors.centerIn: parent
        font.pixelSize: 15
        anchors.horizontalCenterOffset: 64
        anchors.verticalCenterOffset: -111
    }

    Label {
        id: label5
        x: -5
        y: -4
        width: 168
        height: 24
        text: qsTr("（取值范围：0~255）")
        anchors.centerIn: parent
        font.pixelSize: 15
        anchors.verticalCenterOffset: -78
        anchors.horizontalCenterOffset: 218
    }

    Label {
        id: label6
        x: 8
        y: 6
        width: 56
        height: 24
        text: qsTr("字节1")
        anchors.centerIn: parent
        font.pixelSize: 15
        anchors.verticalCenterOffset: 60
        anchors.horizontalCenterOffset: -128
    }

    Label {
        id: label7
        x: 4
        y: 10
        width: 56
        height: 24
        text: qsTr("字节2")
        anchors.centerIn: parent
        font.pixelSize: 15
        anchors.horizontalCenterOffset: -35
        anchors.verticalCenterOffset: 60
    }

    Label {
        id: label8
        x: -2
        y: 2
        width: 56
        height: 24
        text: qsTr("字节3")
        anchors.centerIn: parent
        font.pixelSize: 15
        anchors.verticalCenterOffset: 60
        anchors.horizontalCenterOffset: 64
    }

    Label {
        id: label9
        x: 0
        y: -2
        width: 168
        height: 24
        text: qsTr("（取值范围：0~80）")
        anchors.centerIn: parent
        font.pixelSize: 15
        anchors.horizontalCenterOffset: 33
        anchors.verticalCenterOffset: -40
    }

    MouseArea {
        id: mouseResetArea
        x: -6
        y: 2
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.fill: parent

        Button {
            id: button_set_rfaddr
            x: 42
            y: 154
            text: qsTr("启动设置")
            MouseArea{
                id:mouseArea_set_rfaddr
                anchors.fill: parent
                onPressed: {
//                    myclassExposeByRegType.DroneFrame_MakeAndSerialSend(quint8 Realdata[4],quint8 Realstatus[2],quint8 Command,quint8 CommandData[8],quint8 Heartbeat);//构建和发送无人机串口通信发送帧
//                    myclassExposeByRegType.DroneFrame_MakeAndSerialSend({[0x80,0x80,0x80,0x80]},[0x08,0x00],0x00,[0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00],0x00);//构建和发送无人机串口通信发送帧
//                    myclassExposeByRegType.data_send
//textEdit_set_rfaddr1.data
                    myclassExposeByRegType.setRFaddr(textEdit_set_rfaddr1.text,textEdit_set_rfaddr2.text,textEdit_set_rfaddr3.text,textEdit_set_rfch.text);
//                    myclassExposeByRegType.setRFaddr(textEdit_set_rfaddr1.data,textEdit_set_rfaddr1.data,textEdit_set_rfaddr1.data,textEdit_set_rfaddr1.data);

                }
            }

        }

        Button {
            id: button_read_rfaddr
            x: 36
            y: 242
            text: qsTr("查询当前地址")
        }

        Label {
            id: label10
            x: -2
            y: 2
            width: 56
            height: 24
            text: qsTr("通道")
            anchors.centerIn: parent
            font.pixelSize: 15
            anchors.horizontalCenterOffset: 184
            anchors.verticalCenterOffset: 61
        }

        TextEdit {
            id: textEdit_set_rfaddr2
            x: 268
            y: 73
            width: 80
            height: 20
            text: qsTr("22")
            font.pixelSize: 20

        }

        TextEdit {
            id: textEdit_set_rfaddr3
            x: 372
            y: 73
            width: 80
            height: 20
            text: qsTr("32")
            font.pixelSize: 20
        }

        TextEdit {
            id: textEdit_read_rfch
            x: 488
            y: 252
            width: 80
            height: 20
            text: qsTr("0")
            font.pixelSize: 20
        }

        TextEdit {
            id: textEdit_set_rfch
            x: 182
            y: 108
            width: 80
            height: 20
            text: qsTr("0")
            font.pixelSize: 20
        }

        TextEdit {
            id: textEdit_set_rfaddr1
            x: 182
            y: 73
            width: 80
            height: 20
            text: qsTr("12")
            font.pixelSize: 20
        }
    }

    TextEdit {
        id: textEdit_read_rfaddr1
        x: 183
        y: 252
        width: 80
        height: 20
        text: qsTr("0")
        font.pixelSize: 20
    }

    TextEdit {
        id: textEdit_read_rfaddr2
        x: 269
        y: 252
        width: 80
        height: 20
        text: qsTr("0")
        font.pixelSize: 20
    }

    TextEdit {
        id: textEdit_read_rfaddr3
        x: 367
        y: 252
        width: 80
        height: 20
        text: qsTr("0")
        font.pixelSize: 20
    }

}
