import QtQuick 2.9
import QtQuick.Controls 2.2

import RegisterMyType 1.0


ApplicationWindow {
    id: magCongrolPage
    x: 350
    y: 325
    width: 640
    height: 320

    title: "磁力计-实验操作"


    Label{
        id: label
        text: qsTr("X轴操作")
        anchors.verticalCenterOffset: -101
        anchors.horizontalCenterOffset: -216
        height: 20
        width: 84
        anchors.centerIn: parent
        font.pixelSize: 20
    }

    Label {
        id: label1
        x: 62
        y: 104
        font.pixelSize: 20
        text: qsTr("Z轴操作")
    }

    Button {
        id: button
        x: 40
        y: 189
        text: qsTr("复位")

        MouseArea{
            id:mouseResetArea
            anchors.fill: parent
            onPressed: {
                slider.value = 0;
                slider1.value = 0;
                myclassExposeByRegType.sendto("ff5580808080080027000000000000000000");
            }
        }
    }

    Button {
        id: button1
        x: 252
        y: 189
        text: qsTr("磁力计校准")

        MouseArea{
            id:mouseVerifyArea
            anchors.fill: parent
            onPressed: {

//                myclassExposeByRegType.sendto("ff5580808080080002000000000000000000");
            }
        }
    }

    CheckBox {
        id: checkBox
        x: 458
        y: 189
        text: qsTr("倾角补偿")

        checkState: allChildrenChecked ? Qt.Checked :
                       anyChildChecked ? Qt.PartiallyChecked : Qt.Unchecked

        nextCheckState: function() {
            if (checkState == Qt.Checked){
                myclassExposeByRegType.sendto("ff5580808080080002b00000000000000000");
                return Qt.Unchecked
            }
            else{
                myclassExposeByRegType.sendto("ff5580808080080002b01000000000000000");
                return Qt.Checked
            }
        }

    }

    Label {
        id: label2
        x: 458
        y: 49
        width: 29
        height: 20
        font.pixelSize: 20
        text: slider1.value + qsTr(" °")
    }

    Label {
        id: label3
        x: 463
        y: 104
        width: 24
        height: 20
        font.pixelSize: 20
        text: slider.value + qsTr(" °")
    }

    Slider {
        id: slider1
        x: 202
        y: 39
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
        x: 202
        y: 94
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
