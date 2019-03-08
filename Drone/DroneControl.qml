import QtQuick 2.9
import QtQuick.Controls 2.2

import QtMultimedia 5.4

import ".."
import "../Component"
import "./DronePage"
import "../Sensor/DroneSensor/MagPage"
import "../Sensor/DroneSensor/UartData"

import RegisterMyType 1.0
import RegisterSystemOpen 1.0



Page {

    property StackView stack: null
    width: 1920
    height: 1080

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
            myclassExposeByRegType.setSerialSendRequest(true);
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
        anchors.centerIn: parent
        height: 40
        radius: 20
        border.width: 1
        anchors.verticalCenterOffset: -472
        anchors.horizontalCenterOffset: -614
        width: 106
    }

    RFSetPage{
        id:rfsetpage
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


    MyClassType
    {
        id:myclassExposeByRegType
    }

    DroneInfoPage{
        id:droneInfoPage
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
            droneInfoPage.active;
            droneInfoPage.show();
        }
    }

    DroneProjectDevelopPage{
        id:droneprojectdeveloppage
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
            droneprojectdeveloppage.active;
            droneprojectdeveloppage.show();
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
//                    console.log("key FOUND:" + comboBox[key]);
                    portName = comboModel.getElement(comboBox[key]);

                    break;
                }
            }
            myclassExposeByRegType.openAndSetPort(portName,3,3,0,0,0);

        }
    }


    DroneCharViewPage
    {
        id:dronecharview
        x:550
        y:155
        visible: true
    }

    Rectangle {
        x:1262
        y:570
        width: 402
        height: 400
        color: "#00000000"
        border.width: 1

        DataBasicRecAndSendPage{
            id:magbasicrecandsendpage
            x:2
            y:2
            width: 400
            height: 400
        }
    }


    Rectangle {
        x:1263
        y:130
        width: 402
        height: 400
        color: "#00000000"
        border.width: 1

        DroneDataApplicatePage{
            id:droneDataApplicatePage
            x:2
            y:2
            width: 400
            height: 400
        }
    }




    Component.onCompleted: {
        myclassExposeByRegType.getPortInfo();
        comboModel.setComboList(myclassExposeByRegType.receivePort());
    }

//    Rectangle {
//        x:138
//        y:130
//        width: 402
//        height: 800
//        color: "#00000000"
//        border.width: 1

//        DroneControlPage{
//            id:dronecongrolPage

//            x:2
//            y:2
//            width: 400
//            height: 800
    //        }
    //    }

    DroneControlPage{
        id:dronecongrolPage

        x:138
        y:130
        width: 400
        height: 800
    }

    Button {
        id: button3
        x: 975
        y: 48
        text: qsTr("进入模块化编程")
        font.bold: true
        font.pointSize: 20

        onClicked: {
            stack.pop();
            pageDrone.stack = stack;
            stack.push(pageDrone);
        }
    }


    Drone {
        id: pageDrone
        visible: false
        stack: stack
    }
}
