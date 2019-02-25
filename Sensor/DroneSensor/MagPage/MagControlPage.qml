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
        text: qsTr("X轴操作")
        font.bold: true
        anchors.verticalCenterOffset: -56
        anchors.horizontalCenterOffset: -128
        height: 30
        width: 110
        anchors.centerIn: parent
        font.pixelSize: 30
    }

    Label {
        id: label1
        x: 22
        y: 54
        width: 112
        height: 35
        font.pixelSize: 30
        text: qsTr("Z轴操作")
        font.bold: true
    }

    Button {
        id: button
        x: 22
        y: 183
        text: qsTr("复位")
        font.bold: true
        font.pointSize: 22

        //        MouseArea{
//            id:mouseResetArea
//            anchors.fill: parent
//            onPressed: {
//                slider.value = 0;
//                slider1.value = 0;
//                myclassExposeByRegType.sendto("ff5580808080080027000000000000000000");
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

        //        MouseArea{
//            id:mouseVerifyArea
//            anchors.fill: parent
//            onPressed: {

//                myclassExposeByRegType.sendto("ff5580808080080002000000000000000000");
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

//    MyClassType
//    {
//        id:myclassExposeByRegType
//    }


}
