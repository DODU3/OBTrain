import QtQuick 2.9
import QtQuick.Controls 2.2

//import RegisterMyType 1.0

ApplicationWindow {
    id: rfsetpage

    x: 350
    y: 200

    width: 750
    height: 350
    maximumHeight:350
    minimumHeight:350
    maximumWidth:750
    minimumWidth:750

//    rfsetpage.maximumHeight:
    title: "配置无线地址"

    background: Image {
        source: "../images/background.png"
    }

//    setMaximumHeight:350
//    setMinimumHeight:350

//    sesetWindowFlags(Qt::Dialog|Qt::FramelessWindowHint);

//    MyClassType
//    {
//        id:myclassExposeByRegType
//    }

    Label {
        id: label
        width: 105
        height: 24
        text: qsTr("地址设置：")
        font.pointSize: 40
        font.bold: true
        anchors.centerIn: parent
        font.pixelSize: 28
        anchors.verticalCenterOffset: -68
        anchors.horizontalCenterOffset: -281
    }

    Label {
        id: label1
        x: -3
        y: -6
        width: 104
        height: 24
        text: qsTr("通道设置：")
        font.bold: true
        anchors.centerIn: parent
        font.pixelSize: 28
        anchors.horizontalCenterOffset: -282
        anchors.verticalCenterOffset: -17
    }

    Label {
        id: label2
        x: 8
        y: 6
        width: 71
        height: 24
        text: qsTr("字节1")
        font.bold: true
        anchors.centerIn: parent
        font.pixelSize: 25
        anchors.horizontalCenterOffset: -161
        anchors.verticalCenterOffset: -111
    }

    Label {
        id: label3
        x: 4
        y: 10
        width: 71
        height: 24
        text: qsTr("字节2")
        font.bold: true
        anchors.centerIn: parent
        font.pixelSize: 25
        anchors.verticalCenterOffset: -111
        anchors.horizontalCenterOffset: -70
    }

    Label {
        id: label4
        x: -2
        y: 2
        width: 69
        height: 24
        text: qsTr("字节3")
        font.bold: true
        anchors.centerIn: parent
        font.pixelSize: 25
        anchors.horizontalCenterOffset: 33
        anchors.verticalCenterOffset: -111
    }

    Label {
        id: label5
        x: -5
        y: -4
        width: 219
        height: 24
        text: qsTr("（取值范围：0~255）")
        font.bold: true
        anchors.centerIn: parent
        font.pixelSize: 25
        anchors.verticalCenterOffset: -68
        anchors.horizontalCenterOffset: 208
    }

    Label {
        id: label6
        x: 8
        y: 6
        width: 56
        height: 24
        text: qsTr("字节1")
        font.bold: true
        anchors.centerIn: parent
        font.pixelSize: 25
        anchors.verticalCenterOffset: 83
        anchors.horizontalCenterOffset: -100
    }

    Label {
        id: label7
        x: 4
        y: 10
        width: 56
        height: 24
        text: qsTr("字节2")
        font.bold: true
        anchors.centerIn: parent
        font.pixelSize: 25
        anchors.horizontalCenterOffset: -14
        anchors.verticalCenterOffset: 83
    }

    Label {
        id: label8
        x: -2
        y: 2
        width: 56
        height: 24
        text: qsTr("字节3")
        font.bold: true
        anchors.centerIn: parent
        font.pixelSize: 25
        anchors.verticalCenterOffset: 83
        anchors.horizontalCenterOffset: 74
    }

    Label {
        id: label9
        x: 0
        y: -2
        width: 233
        height: 24
        text: qsTr("（取值范围：0~80）")
        font.bold: true
        anchors.centerIn: parent
        font.pixelSize: 25
        anchors.horizontalCenterOffset: 19
        anchors.verticalCenterOffset: -17
    }

    Button {
        id: button_set_rfaddr
        x: 41
        y: 195
        text: qsTr("启动设置")
        font.bold: true
        font.pointSize: 20
        onPressed: {
//                    myclassExposeByRegType.DroneFrame_MakeAndSerialSend(quint8 Realdata[4],quint8 Realstatus[2],quint8 Command,quint8 CommandData[8],quint8 Heartbeat);//构建和发送无人机串口通信发送帧
//                    myclassExposeByRegType.DroneFrame_MakeAndSerialSend({[0x80,0x80,0x80,0x80]},[0x08,0x00],0x00,[0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00],0x00);//构建和发送无人机串口通信发送帧
//                    myclassExposeByRegType.data_send
//textEdit_set_rfaddr1.data
            myclassExposeByRegType.setRFaddr(textEdit_set_rfaddr1.text,textEdit_set_rfaddr2.text,textEdit_set_rfaddr3.text,textEdit_set_rfch.text);
//                    myclassExposeByRegType.setRFaddr(textEdit_set_rfaddr1.data,textEdit_set_rfaddr1.data,textEdit_set_rfaddr1.data,textEdit_set_rfaddr1.data);
            myclassExposeByRegType.setsettingAddrFlag(true);
            timer1.start();
        }


    }


    Button {
        id: button_read_rfaddr
        x: 41
        y: 275
        text: qsTr("查询当前地址")
        font.bold: true
        font.pointSize: 20
        onPressed: {
//            myclassExposeByRegType.sendto("ff558080808008002a000000000000000000");
            myclassExposeByRegType.sendCMD("2a", "808080800800", "0000000000000000");
            myclassExposeByRegType.setsettingAddrFlag(true);
            timer1.start();
        }
    }

    Label {
        id: label10
        x: -2
        y: 2
        width: 56
        height: 24
        text: qsTr("通道")
        font.bold: true
        anchors.centerIn: parent
        font.pixelSize: 25
        anchors.horizontalCenterOffset: 182
        anchors.verticalCenterOffset: 83
    }

    TextInput {
        id: textEdit_set_rfaddr2
        x: 269
        y: 99
        width: 81
        height: 20
        text: qsTr("22")
        clip: false
        font.bold: true
        font.pixelSize: 25
        validator: IntValidator{bottom: 0; top: 255;}
        focus: true
//        Rectangle {
//                    color: "black"
//                }
    }

    TextInput {
        id: textEdit_set_rfaddr3
        x: 373
        y: 99
        width: 80
        height: 20
        text: qsTr("32")
        font.bold: true
        font.pixelSize: 25
        validator: IntValidator{bottom: 0; top: 255;}
        focus: true
    }

    Label {
        id: textEdit_read_rfch
        x: 535
        y: 285
        width: 80
        height: 20
        text: qsTr("0")
        font.bold: true
        font.pixelSize: 25
    }

    TextInput {
        id: textEdit_set_rfch
        x: 182
        y: 146
        width: 87
        height: 24
        text: qsTr("0")
        font.bold: true
        font.pixelSize: 25
        validator: IntValidator{bottom: 0; top: 80;}
        focus: true
    }

    TextInput {
        id: textEdit_set_rfaddr1
        x: 178
        y: 99
        width: 80
        height: 20
        text: qsTr("12")
        font.bold: true
        font.pixelSize: 25
        //validator: RegExpValidator{regExp: /[0-2][0-9][0-9]/}
        validator: IntValidator{bottom: 0; top: 255;}
        focus: true
    }


    Label {
        id: textEdit_read_rfaddr1
        x: 247
        y: 285
        width: 80
        height: 20
        text: qsTr("0")
        font.bold: true
        font.pixelSize: 25
    }

    Label {
        id: textEdit_read_rfaddr2
        x: 335
        y: 285
        width: 80
        height: 20
        text: qsTr("0")
        font.bold: true
        font.pixelSize: 25
    }

    Label {
        id: textEdit_read_rfaddr3
        x: 421
        y: 285
        width: 80
        height: 20
        text: qsTr("0")
        font.bold: true
        font.pixelSize: 25
    }

    Timer{
        id:timer1
        interval: 200
        repeat: true
        triggeredOnStart: false

        onTriggered: {
            if(false === myclassExposeByRegType.getsettingAddrFlag()){
                timer1.stop();
            }
            textEdit_read_rfaddr1.text = myclassExposeByRegType.getaddr1();
            textEdit_read_rfaddr2.text = myclassExposeByRegType.getaddr2();
            textEdit_read_rfaddr3.text = myclassExposeByRegType.getaddr3();
            textEdit_read_rfch.text = myclassExposeByRegType.getaddrch();
        }
    }

    Button {
        id: button_set_rfaddr1
        x: 194
        y: 195
        text: qsTr("随机地址")
        font.bold: true
        font.pointSize: 20
        onPressed: {
            textEdit_set_rfaddr1.text = myclassExposeByRegType.randomNumStr(0, 255);
            textEdit_set_rfaddr2.text = myclassExposeByRegType.randomNumStr(0, 255);
            textEdit_set_rfaddr3.text = myclassExposeByRegType.randomNumStr(0, 255);
            textEdit_set_rfch.text = myclassExposeByRegType.randomNumStr(0, 80);
        }
    }

}
