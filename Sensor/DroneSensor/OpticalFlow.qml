import QtQuick 2.9
import QtQuick.Controls 2.2
import "../../Component"
import ".."
import "./UartData"
import "./OptiPage"

import RegisterMyType 1.0
import RegisterDataFresh 1.0

Page {


    property StackView stack: null

    property real rollangle: 0
    property real pitchangle: 0

    background: Image {
        source: "../../images/background.png"
    }

    Button {
        height: 32
        width: 120
        text: "<-"
        anchors.left: parent.left
        anchors.top: parent.top
        onClicked: {
            if(true === myclassExposeByRegType.getserialOpenFlag()){
                qmlToggleButton.toggleRight();
            }
            stack.pop()
        }
    }


    ComboBox {
        id: comboBox
        objectName: "portComboBox"
        x: 146
        y: 48
        font.bold: true
        font.pointSize: 20

        model:comboModel.comboList
    }

    QmlToggleButton{
        id: qmlToggleButton
//        anchors.centerIn: parent
        height: 40
        radius: 20
        x:305
        y:48
        border.width: 1
        width: 106
    }

    Button {
        id: button7
        x: 437
        y: 48
        text: qsTr("配置无线地址")
        font.bold: true
        font.pointSize: 20
        onClicked:
        {
            rfsetpage.show();
        }

    }

    Button {
        id: button1
        x: 653
        y: 50
        text: qsTr("教学资料")
        font.bold: true
        font.pointSize: 20

        onClicked:
        {
            optiinfopage.show();
        }

    }

    Button {
        id: button2
        x: 821
        y: 48
        text: qsTr("工程实例")
        font.bold: true
        font.pointSize: 20

        onClicked:
        {
            optiprojectdeveloppage.active;
            optiprojectdeveloppage.show();
        }
    }

    Connections {
        target: qmlToggleButton
        onToggleRight: {
            myclassExposeByRegType.closePort();

        }

    }

    Connections {
        target: qmlToggleButton
        onToggleLeft: {
            var portName;
            var keys = Object.keys(comboBox);
            for(var i = 0; i < keys.length; i++) {
                var key = keys[i];

                if (key === "currentIndex") {
                    portName = comboModel.getElement(comboBox[key]);
                    break;
                }
            }
            myclassExposeByRegType.openAndSetPort(portName,3,3,0,0,0);

        }
    }

    Image {
        id: refresh_button
        source: "../../Component/refresh.png"
        x: 84
        y: 50
        height: 38
        width: 36
        MouseArea{
            anchors.fill: parent
            onClicked: {
                myclassExposeByRegType.getPortInfo();
                comboModel.setComboList(myclassExposeByRegType.receivePort());
            }
        }
    }

    MyClassType
    {
        id:myclassExposeByRegType
    }

    RFSetPage{
        id:rfsetpage
    }

    OptiProjectDevelopPage{
        id:optiprojectdeveloppage
    }

    OptiInfoPage{
        id:optiinfopage
    }

    Text {
        id: element
        x: 366
        y: 231
        text: qsTr("x方向偏移量(cm)：")
        font.bold: true
        font.pixelSize: 30
    }

    Text {
        id: element1
        x: 366
        y: 293
        text: qsTr("y方向偏移量(cm)：")
        font.bold: true
        font.pixelSize: 30
    }

    Button {
        id: button3
        x: 746
        y: 258
        text: qsTr("偏移量复位")
        font.bold: true
        font.pointSize: 22
        onClicked:
        {
            myclassExposeByRegType.sendCMD("2f", "808080800800", "0000000000000000");
        }
    }

    Text {
        id: element2
        x: 637
        y: 231
        text: qsTr("0")
        font.bold: true
        font.pixelSize: 30
    }

    Text {
        id: element3
        x: 637
        y: 293
        text: qsTr("0")
        font.bold: true
        font.pixelSize: 30
    }

    Timer{
        id:timer1
        interval: 1000
        repeat: true
        triggeredOnStart: false
        running: true

        onTriggered: {
            if(myclassExposeByRegType.getCurrentPage() === 11)
            {
//                element6.text = myclassExposeByRegType.getopticalflowspeedx();
//                element7.text = myclassExposeByRegType.getopticalflowspeedy();
                element2.text = myclassExposeByRegType.getopticalflowsumx();
                element3.text = myclassExposeByRegType.getopticalflowsumy();
            }

        }
    }

    Slider {
        id: sliderspeed2
        x: 366
        y: 464
        width: 886
        height: 40
        from: 30
        to: 180
        stepSize: 1
        value: 0
    }

    Label {
        id: label5
        x: 366
        y: 428
        width: 325
        height: 30
        text: qsTr("实验平台水平角度：") + sliderspeed2.value + qsTr(" °")
        font.pixelSize: 30
        font.bold: true
    }

    Button {
        id: buttonstartwork
        x: 568
        y: 796
        width: 123
        height: 80
        text: qsTr("实验平台\n角度设置")
        font.pointSize: 22
        font.bold: true
        onClicked: {
            myclassExposeByRegType.setLabAngle(sliderspeed3.value.toLocaleString(), sliderspeed2.value.toLocaleString());
            rollangle = sliderspeed2.value;
            pitchangle = sliderspeed3.value;

        }
    }

//    Button {
//        id: buttonstartwork1
//        x: 556
//        y: 796
//        width: 123
//        height: 80
//        text: qsTr("垂直角度\n设置")
//        font.pointSize: 22
//        font.bold: true
//        onClicked: {
//            myclassExposeByRegType.setLabAngle("90", rollangle.toLocaleString());
//            pitchangle = 90;

//        }
//    }

    Button {
        id: button4
        x: 366
        y: 796
        width: 123
        height: 80
        text: qsTr("实验平台\n复位")
        font.pointSize: 22
        font.bold: true
        onClicked: {
            myclassExposeByRegType.sendCMD("27", "808080800800", "0000000000000000");
            sliderspeed2.value = 0;
            sliderspeed3.value = 0;
            pitchangle = 0;
            rollangle = 0;
        }
    }

    Slider {
        id: sliderspeed3
        x: 366
        y: 573
        width: 886
        height: 40
        from: -60
        stepSize: 1
        to: 90
        value: 0
    }

    Label {
        id: label6
        x: 366
        y: 537
        width: 325
        height: 30
        text: qsTr("实验平台垂直角度：") + sliderspeed3.value + qsTr(" °")
        font.pixelSize: 30
        font.bold: true
    }

    Button {
        id: button5
        x: 753
        y: 796
        width: 132
        height: 80
        text: qsTr("设置距离")
        font.pointSize: 22
        font.bold: true
        onClicked: {
            myclassExposeByRegType.setOptDistance(sliderspeed4.value);
        }
    }

    Slider {
        id: sliderspeed4
        x: 366
        y: 692
        width: 886
        height: 40
        from: 0
        stepSize: 1
        to: 150
        value: 50
    }

    Label {
        id: label7
        x: 366
        y: 656
        width: 325
        height: 30
        text: qsTr("光流离物体的距离：") + sliderspeed4.value + qsTr(" cm")
        font.pixelSize: 30
        font.bold: true
    }
}

