import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2


import RegisterDataFresh 1.0
import "../UartData"

Item {
    id: baroDataApplicatePage

    width: 400
    height: 740

//    title: "气压计-数据保存与应用"

    Button {
        id: button
        x: 8
        y: 626
        text: qsTr("开始打印")
        font.bold: true
        font.pointSize: 22

        onPressed: {
//            textArea.append("aa"+"bb"+"cc");
////                textArea.cursorPosition = textArea.text.length;
            if(mydataFresh.serialDataPrintFlag == true){
                mydataFresh.serialDataPrintFlag = false;
                button1.enabled = true;
                button.text = qsTr("开始打印");
                timer1.stop();
            }
            else{
                //开始打印
                mydataFresh.serialDataPrintFlag = true;
                button1.enabled = false;
                button.text = qsTr("停止打印");
                myclassExposeByRegType.clearserialSaveAndApp();
                timer1.start();
            }
//            mydataFresh.buttonStartClick();

        }

    }


    Button {
        id: button1
        x: 181
        y: 626
        text: qsTr("保存")
        font.bold: true
        font.pointSize: 22
        enabled: true

        onPressed: {
            //fileDialog.open();
            //timer1.stop();
            mydataFresh.buttonSaveClick("\\Content_resource\\气压计模组\\数据保存\\", textArea.text);
            //timer1.start();
            datasavecompletedw.show();
        }
    }

    DataSaveCompletedPage{
        id:datasavecompletedw
    }
//    DataSaveCompleted2Page{

    ScrollView {
        x: 0
        y: 0
        width: 400
        height: 600
        TextArea {
            id: textArea
            x: -10
            y: -6
            width: 400
            height: 597
            text: "气压计-数据保存与应用"
            font.family: "Times New Roman"
            font.bold: true
            placeholderText: qsTr("气压计-数据保存与应用")
            //            objectName: "MagDateAppPageText"
//            font.pointSize: 9
            font.pixelSize: 20
            //text: myserialtest1.receivedata
            readOnly: true
            selectByKeyboard: true
            selectByMouse: true
            //background: ""

        }
    }

//    FileDialog{
//        id: fileDialog
//        title: qsTr("文件保存")
//        nameFilters: "*.txt"
//        selectExisting: false
//        //fileMode: FileDialog.SaveFile
//        onAccepted: {

//        }
//    }

    MyDataFresh{
        id:mydataFresh
    }

    Timer{
        id:timer1
        interval: 200
        repeat: true
        triggeredOnStart: false

        onTriggered: {

            textArea.text = myclassExposeByRegType.getserialSaveAndApp();
            textArea.cursorPosition = textArea.text.length;

        }
    }

    Button {
        id: button2
        x: 8
        y: 685
        text: qsTr("打开保存文件夹")
        font.bold: true
        font.pointSize: 22
        enabled: true
        onPressed: {
            mydataFresh.buttonOpenFolderClick("\\Content_resource\\气压计模组\\数据保存\\");
        }
    }

    Component.onCompleted: {
        //timer1.start();
    }
//    function addText(qs){
//        textArea.append(qs);
//    }

//    Connections {
//        target: background

//    }
}
