import QtQuick 2.9
import QtQuick.Controls 2.2
import ".."


import RegisterMyType 1.0
import RegisterSystemOpen 1.0

Page {

    width: 1920
    height: 1080

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
        onClicked: stack.pop()
    }

    Label{
        id: label
        text: qsTr("超声避障")
        anchors.verticalCenterOffset: -289
        anchors.horizontalCenterOffset: -38
        height: 80
        width: 240
        anchors.centerIn: parent
        font.pixelSize: 20

    }

//    ComboBox {
//        id: comboBox
//        objectName: "portComboBox"
//        x: 144
//        y: 166

//        model:comboModel.comboList

//    }

//    Button {
//        id: button
//        x: 321
//        y: 166
//        text: qsTr("Connect")

//        onClicked: {
//            var portName;
//            var keys = Object.keys(comboBox);
//            for(var i = 0; i < keys.length; i++) {
//                var key = keys[i];
////                console.log(key + ' : ' + comboBox[key]);

//                if (key === "currentIndex") {
////                    console.log("key FOUND:" + comboModel.getElement(key));
//                    portName = comboModel.getElement(key);
//                    break;
//                }
//            }
////            myclassExposeByRegType1.openAndSetPort(portName,3,3,0,0,0);

//        }
//    }

    TextEdit {
        id: textEdit
        x: 569
        y: 186
        width: 441
        height: 374
//        text:myclassExposeByRegType1.receivedata
        font.pixelSize: 12

    }

//    MyClassType
//    {
//        id:myclassExposeByRegType1
//    }

//    MySystemOpen
//    {
//        id:mySystemOpenReg1
//    }

    Button {
        id: button1
        x: 164
        y: 270
        text: qsTr("简介")
        onClicked:
        {
//                mySystemOpenReg1.openMagPresent()
        }

//        MouseArea{
//            id:mouseArea
//            anchors.fill: parent
//            onPressed: {
////                mySystemOpenReg1.openMagPresent()
//            }
//        }
    }

    Button {
        id: button2
        x: 164
        y: 487
        text: qsTr("工程实例")
        onClicked:
        {
//                mySystemOpenReg1.openProject()
        }

//        MouseArea{
//            id:mouseProjectArea
//            anchors.fill: parent
//            onPressed: {
////                mySystemOpenReg1.openProject()
//            }
//        }
    }

    Button {
        id: button3
        x: 164
        y: 376
        text: qsTr("流程图")

        MouseArea{
            id:mouseFlowArea
            anchors.fill: parent
            onPressed: {
//                mySystemOpenReg1.openMagFlow()
            }
        }
    }


    Component.onCompleted: {
//         myclassExposeByRegType1.getPortInfo();
//        comboModel.setComboList(myclassExposeByRegType1.receivePort());

    }
}



