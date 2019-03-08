import QtQuick 2.9
import QtQuick.Controls 2.2

import RegisterMyType 1.0

import "../../Sensor/DroneSensor/MagPage"

Item {
    id: droneCongrolPage
    width: 400
    height: 800
    antialiasing: false
    z: 0
    rotation: 0
    transformOrigin: Item.Center

//        title: "OB整机-实验操作"

    property int temp_data: 0;
    property int tem2p_data: 0;

    Button {
        id: button
        x: 15
        y: 60
        text: qsTr("上锁/解锁")
        font.bold: true
        font.pointSize: 22
        onClicked:
        {
//                myclassExposeByRegType.sendto("ff5580808080080027000000000000000000");
            myclassExposeByRegType.sendCMD("03", "808080800800", "0000000000000000");
        }
    }

    Button {
        id: button2
        x: 206
        y: 60
        text: qsTr("起飞/降落")
        font.bold: true
        font.pointSize: 22
        onClicked:
        {
//                myclassExposeByRegType.sendto("ff5580808080080027000000000000000000");
            myclassExposeByRegType.sendCMD("04", "808080800800", "0000000000000000");
        }
    }

    Button {
        id: button3
        x: 8
        y: 647
        text: qsTr("校准陀螺仪")
        font.bold: true
        font.pointSize: 22
        onClicked:
        {
//                myclassExposeByRegType.sendto("ff5580808080080027000000000000000000");
            myclassExposeByRegType.sendCMD("01", "808080800800", "0000000000000000");
        }
    }


    Button {
        id: button1
        x: 202
        y: 647
        text: qsTr("电子罗盘校准")
        font.bold: true
        font.pointSize: 22

        onClicked:
        {
            mymagcalibrationpage.show();

//                myclassExposeByRegType.sendto("ff5580808080080002000000000000000000");
            myclassExposeByRegType.sendCMD("02", "808080800800", "0000000000000000");
            timera.start();
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



    MagCalibrationPage{
        id:mymagcalibrationpage
        x: 400
        y: 150
    }

    Button {
        id: button4
        x: 125
        y: 150
        text: qsTr("上升")
        font.pointSize: 22
        font.bold: true
        onClicked:
        {
            myclassExposeByRegType.sendCMD("2c", "808080800800", "001E000000000000");//固定上升30cm
        }
    }

    Button {
        id: button5
        x: 125
        y: 301
        text: qsTr("下降")
        font.pointSize: 22
        font.bold: true
        onClicked:
        {
            myclassExposeByRegType.sendCMD("2c", "808080800800", "FFE2000000000000");//固定下降30cm
        }
    }

    Button {
        id: button6
        x: 25
        y: 472
        text: qsTr("左侧飞")
        font.pointSize: 22
        font.bold: true
        onClicked:
        {
            myclassExposeByRegType.sendCMD("2c", "808080800800", "00000000FFE20000");
        }
    }

    Button {
        id: button7
        x: 228
        y: 472
        text: qsTr("右侧飞")
        font.pointSize: 22
        font.bold: true
        onClicked:
        {
            myclassExposeByRegType.sendCMD("2c", "808080800800", "00000000001E0000");
        }
    }

    Button {
        id: button8
        x: 25
        y: 221
        text: qsTr("左偏航")
        font.pointSize: 22
        font.bold: true
        onClicked:
        {
            myclassExposeByRegType.sendCMD("2c", "808080800800", "000000000000001E");
        }
    }

    Button {
        id: button9
        x: 228
        y: 221
        text: qsTr("右偏航")
        font.pointSize: 22
        font.bold: true
        onClicked:
        {
            myclassExposeByRegType.sendCMD("2c", "808080800800", "000000000000FFE2");
        }
    }

    Button {
        id: button10
        x: 125
        y: 408
        text: qsTr("前进")
        font.pointSize: 22
        font.bold: true
        onClicked:
        {
            myclassExposeByRegType.sendCMD("2c", "808080800800", "0000FFE200000000");
        }
    }

    Button {
        id: button11
        x: 125
        y: 541
        text: qsTr("后退")
        font.pointSize: 22
        font.bold: true
        onClicked:
        {
            myclassExposeByRegType.sendCMD("2c", "808080800800", "0000001E00000000");
        }
    }

    MyClassType
    {
        id:myclassExposeByRegType
    }

    CheckBox {
        id: checkBox_Control
        x: 15
        y: 747
        text: qsTr("电脑控制无人机")
        font.bold: true
        font.pointSize: 20
        checkState: Qt.Checked

        nextCheckState: function() {
            if (checkState == Qt.Checked){
                return Qt.Unchecked
            }
            else{

                if(checkBox_labupdate.checkState == Qt.Checked)
                {
                    checkBox_labupdate.checkState = Qt.Unchecked;
                    timer.running=false;
                    timer.repeat=false;
                    if(true === myclassExposeByRegType.getserialOpenFlag())
                    {
                        myclassExposeByRegType.setMagCorner(0,0);
                    }
                }
                  return Qt.Checked
            }
        }
    }

    CheckBox {
        id: checkBox_labupdate
        x: 15
        y: 701
        text: qsTr("同步无人机与试验台")
        font.bold: true
        font.pointSize: 20
        checkState: Qt.Unchecked

        nextCheckState: function() {
            if (checkState == Qt.Checked){

                timer.running=false;
                timer.repeat=false;
                if(true === myclassExposeByRegType.getserialOpenFlag())
                {
                    myclassExposeByRegType.setMagCorner(0,0);
                }
                return Qt.Unchecked
            }
            else{

                if(checkBox_Control.checkState == Qt.Checked)
                {
                    checkBox_Control.checkState = Qt.Unchecked;
                }
                timer.running=true;
                timer.repeat=true;

                return Qt.Checked
            }
        }
    }



    Timer {
        //Timer for demo rotation of compass

        interval: 100
        running: true
        repeat: true

        onTriggered: {

            if(true === myclassExposeByRegType.getserialDrawClearFlag()){

                myclassExposeByRegType.setserialDrawClearFlag(false);
            }

            if(true === myclassExposeByRegType.getserialOpenFlag())
            {

                    //同步飞机和试验台动作
                    if(checkBox_labupdate.checkState == Qt.Checked)
                    {
                        temp_data=myclassExposeByRegType.getAnglePitchNum();
                        tem2p_data=myclassExposeByRegType.getAngleYawNum();
                        if(tem2p_data<0)
                        {
                            tem2p_data+=360;
                        }
                        if((tem2p_data<270)&&(tem2p_data>0))
                        {
                            myclassExposeByRegType.setMagCorner(tem2p_data,temp_data);
                        }

                    }

            }
        }
    }


}
