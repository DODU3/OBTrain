import QtQuick 2.9
import QtQuick.Controls 2.2

import RegisterMyType 1.0


Item {
    id: magCongrolPage
    width: 400
    height: 200
    antialiasing: false
    z: 0
    rotation: 0
    transformOrigin: Item.Center

//        title: "电子罗盘-实验操作"


    Label{
        id: label
        text: qsTr("X轴控制")
        font.bold: true
        anchors.verticalCenterOffset: -67
        anchors.horizontalCenterOffset: -124
        height: 30
        width: 110
        anchors.centerIn: parent
        font.pixelSize: 30
    }

    Label {
        id: label1
        x: 21
        y: 70
        width: 112
        height: 35
        font.pixelSize: 30
        text: qsTr("Z轴控制")
        font.bold: true
    }

    Button {
        id: button
        x: 26
        y: 126
        text: qsTr("复位")
        font.bold: true
        font.pointSize: 22
        onClicked:
        {
            slider.value = 0;
            slider1.value = 0;
//                myclassExposeByRegType.sendto("ff5580808080080027000000000000000000");
            myclassExposeByRegType.sendCMD("27", "808080800800", "0000000000000000");
        }
//                MouseArea{
//            id:mouseResetArea
//            anchors.fill: parent
//            onPressed: {
//                slider.value = 0;
//                slider1.value = 0;
////                myclassExposeByRegType.sendto("ff5580808080080027000000000000000000");
//                myclassExposeByRegType.sendCMD("27", "808080800800", "0000000000000000");
//            }
//        }
    }

    Button {
        id: button1
        x: 141
        y: 126
        text: qsTr("倾角测量模组校准")
        font.bold: true
        font.pointSize: 22

        onClicked:
        {
            myclassExposeByRegType.sendCMD("01", "808080800800", "0000000000000000");
        }
    }

    Label {
        id: label2
        x: 340
        y: 18
        width: 49
        height: 30
        font.pixelSize: 30
        text: slider1.value + qsTr(" °")
    }

    Label {
        id: label3
        x: 340
        y: 72
        width: 51
        height: 30
        font.pixelSize: 30
        text: slider.value + qsTr(" °")
    }

    Slider {
        id: slider1
        x: 137
        y: 13
        stepSize: 1
        to: 90
        from: -90
        value: 0

        onValueChanged: {
            myclassExposeByRegType.setMagCorner(slider.value,value);

        }
    }

    Slider {
        id: slider
        x: 130
        y: 67
        width: 207
        height: 40
        stepSize: 1
        to: 360
        value: 0

        onValueChanged: {
            myclassExposeByRegType.setMagCorner(value,slider1.value);
        }
    }


    MyClassType
    {
        id:myclassExposeByRegType
    }



}
