import QtQuick 2.9
import QtQuick.Controls 2.2

import RegisterMyType 1.0


Item {
    id: magCongrolPage
    width: 400
    height: 400
    antialiasing: false
    z: 0
    rotation: 0
    transformOrigin: Item.Center

//        title: "电子罗盘-实验操作"


    Label{
        id: label
        text: qsTr("X轴控制")
        font.bold: true
        anchors.verticalCenterOffset: -131
        anchors.horizontalCenterOffset: -121
        height: 30
        width: 110
        anchors.centerIn: parent
        font.pixelSize: 30
    }

    Label {
        id: label1
        x: 24
        y: 127
        width: 112
        height: 35
        font.pixelSize: 30
        text: qsTr("Z轴控制")
        font.bold: true
    }

    Button {
        id: button
        x: 22
        y: 183
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
        x: 22
        y: 258
        text: qsTr("磁力计校准")
        font.bold: true
        font.pointSize: 22

        onClicked:
        {
            mymagcalibrationpage.show();
//                mymagcalibrationpage.setX(400);
//                mymagcalibrationpage.setY(150);

//                myclassExposeByRegType.sendto("ff5580808080080002000000000000000000");
            myclassExposeByRegType.sendCMD("02", "808080800800", "0000000000000000");
            timera.start();
        }
//                MouseArea{
//            id:mouseVerifyArea
//            anchors.fill: parent
//            onPressed: {
//                mymagcalibrationpage.show();
////                mymagcalibrationpage.setX(400);
////                mymagcalibrationpage.setY(150);

////                myclassExposeByRegType.sendto("ff5580808080080002000000000000000000");
//               myclassExposeByRegType.sendCMD("02", "808080800800", "0000000000000000");
//                timera.start();
//            }
//        }
    }

    CheckBox {
        id: checkBox
        x: 17
        y: 338
        text: qsTr("倾角补偿")
        font.pointSize: 22
        font.bold: true

        checkState: Qt.Checked
//        checked: true

        nextCheckState: function() {
            if (checkState == Qt.Checked){
//                myclassExposeByRegType.sendto("ff558080808008002b000000000000000001");
                myclassExposeByRegType.sendCMD("2b", "808080800800", "0000000000000000");
                return Qt.Unchecked
//                checkBox.checkState = Qt.Unchecked
            }
            else{
//                myclassExposeByRegType.sendto("ff558080808008002b010000000000000001");
//                checkBox.checkState = Qt.Checked
                myclassExposeByRegType.sendCMD("2b", "808080800800", "0100000000000000");
                return Qt.Checked
            }
        }

    }

    Label {
        id: label2
        x: 343
        y: 54
        width: 49
        height: 30
        font.pixelSize: 30
        text: slider1.value + qsTr(" °")
    }

    Label {
        id: label3
        x: 343
        y: 129
        width: 51
        height: 30
        font.pixelSize: 30
        text: slider.value + qsTr(" °")
    }

    Slider {
        id: slider1
        x: 140
        y: 49
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
        x: 133
        y: 124
        width: 207
        height: 40
        stepSize: 1
        to: 360
        value: 0

        onValueChanged: {
            myclassExposeByRegType.setMagCorner(value,slider1.value);
        }
    }

    Timer {

        id:timera

        interval: 45000
//        running: true
        repeat: false
        triggeredOnStart: false

        onTriggered: {
            timera.stop();
            mymagcalibrationpage.close();
//            console.info("close");
        }
    }

    MyClassType
    {
        id:myclassExposeByRegType
    }

    MagCalibrationPage{
        id:mymagcalibrationpage
        x: 400
        y: 150
    }


}
