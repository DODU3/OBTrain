import QtQuick 2.9
import QtQuick.Controls 2.2

import QtQuick.Scene3D 2.0

import "../../Component"
import ".."
import "./UartData"
import "./IMUPage"


import RegisterMyType 1.0

Page {


    width: 1920
    height: 1080
    font.pointSize: 20

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
        onClicked: {
            if(true === myclassExposeByRegType.getserialOpenFlag()){
                //myclassExposeByRegType.closePort();
                qmlToggleButton.toggleRight();
                //                qmlToggleButton.state = "right";
                //                qmlToggleButton.color = "#CCCCCC";

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
        anchors.centerIn: parent
        height: 40
        radius: 20
        border.width: 1
        anchors.verticalCenterOffset: -472
        anchors.horizontalCenterOffset: -614
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
            imuinfopage.show();
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
            imuprojectdeveloppage.active;
            imuprojectdeveloppage.show();
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

    IMUCharViewPage
    {
        id:imucharview
        x:118
        y:131
        width: 1600
        height: 400
        visible: true
    }

    Rectangle {
        x:625
        y:570
        width: 402
        height: 400
        color: "#00000000"
        border.width: 1

        DataBasicRecAndSendPage{
            id:imubasicrecandsendpage
            x:2
            y:2
            width: 400
            height: 400
        }
    }

    IMUControlPage{
        id:imucongrolPage

        x:1231
        y:364
        width: 400
        height: 200
    }

    Rectangle {
        x:1132
        y:570
        width: 583
        height: 400
        color: "#00000000"
        border.width: 1

        IMUDataApplicatePage{
            id:imudataapplicatepage
            x:2
            y:2
            width: 583
            height: 400
        }
    }



    Rectangle {
        //        id: page
        x: 118
        y: 570
        width: 400
        height: 400
        color: "#00000000"
        border.color: "black"
        // Toyplane entity
        // Toyplane entity
        //        Toyplane {
        //            material: AdsMaterial {
        //                effect: shadowMapEffect
        //                diffuseColor: Qt.rgba(0.9, 0.5, 0.3, 1.0)
        //                shininess: 75
        //            }

//        IMU2D {
//            id: myimu2d
//            width: 400
//            height: 400

//        }
        Scene3D{
            id: scene3d
//            aspects: "input"
            width: 400
            height: 400
            Toyplane3d {
                id:toyplane3d

            }
        }
    }

    Component.onCompleted: {

        myclassExposeByRegType.getPortInfo();
        comboModel.setComboList(myclassExposeByRegType.receivePort());
        //        console.log(positionSource.position.coordinate.latitude,
        //                    positionSource.position.coordinate.longitude)
    }



    Timer {
        id:timer1
        interval: 500
        repeat: true
        triggeredOnStart: false
        running: true

        onTriggered: {
            //            compassuiimu.setBearing(myclassExposeByRegType.getAngleYawNum());
            //            console.log(myclassExposeByRegType.getAngleYawNum());
            toyplane3d.setPitch(myclassExposeByRegType.getAnglePitchNum());
            toyplane3d.setRoll(myclassExposeByRegType.getAngleRollNum());
            toyplane3d.setYaw(myclassExposeByRegType.getAngleYawNum());
        }
    }

    MyClassType
    {
        id:myclassExposeByRegType
    }

    RFSetPage{
        id:rfsetpage
    }

    IMUProjectDevelopPage{
        id:imuprojectdeveloppage
    }

    IMUInfoPage{
        id:imuinfopage
    }





}
