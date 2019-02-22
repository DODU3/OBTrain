import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2
//import ".."
//import "../../../Component"
//import "../PresentPage"
//import "../MagPage"
import RegisterDataFresh 1.0

//import "."

//import "./dataSaveCompleted.qml"

ApplicationWindow {
    id: magDataApplicatePage

    width: 800
    height: 600

    title: "磁力计-数据保存与应用"

    Button {
        id: button
        x: 72
        y: 522
        text: qsTr("开始打印")

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
        x: 232
        y: 522
        text: qsTr("保存")
        enabled: true

        onPressed: {
            //fileDialog.open();
            //timer1.stop();
            mydataFresh.buttonSaveClick(textArea.text);
            //timer1.start();
            datasavecompletedw.show();
        }
    }

    DataSaveCompletedPage{
        id:datasavecompletedw
    }
//    DataSaveCompleted2Page{

    ScrollView {
        x: 72
        y: 65
        width: 605
        height: 433
        TextArea {
            id: textArea
            placeholderText: qsTr("data")
//            objectName: "MagDateAppPageText"
//            font.pointSize: 9
            font.pixelSize: 15
            //text: myserialtest1.receivedata
            readOnly: true
            selectByKeyboard: true
            selectByMouse: true
            //background: ""

        }
    }

    FileDialog{
        id: fileDialog
        title: qsTr("文件保存")
        nameFilters: "*.txt"
        selectExisting: false
        //fileMode: FileDialog.SaveFile
        onAccepted: {

        }
    }

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
        x: 392
        y: 522
        text: qsTr("打开保存文件夹")
        enabled: true
        onPressed: {
            mydataFresh.buttonOpenFolderClick();
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
