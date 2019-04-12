import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2
import "../../Component"
import ".."
import "./UartData"
import "./UltrasonicPage"


import RegisterMyType 1.0
import RegisterDataFresh 1.0

Page {
    id: mainpage_ultrasonic


    width: 1920
    height: 1080
    font.pointSize: 20

    property StackView stack: null
    property int cnt_timer: 0;

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
            ultrasonicinfopage.show();
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
            ultrasonicprojectdeveloppage.active;
            ultrasonicprojectdeveloppage.show();
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



    Button {
        id: button_set_ultrasonic_lowpass_confficient
        x: 146
        y: 461
        text: qsTr("实验2-1：低通滤波参数设定")
        font.pixelSize: 30
        font.bold: true

        onPressed:
        {
            myclassExposeByRegType.setUltrasonicLowpassfliter("20",textEdit_set_lowpass_confficent.text);
        }
    }


    Button {
        id: button_set_ultrasonic_lowpase_compare
        x: 146
        y: 548
        text: qsTr("实验2-2：对比滤波前后超声波测距数据")
        font.pixelSize: 30
        font.bold: true
        onPressed: {

            ultrasonicinfopage_tips.show();
            cnt_timer=0;
            timer_set_ultrasonic.start();

            //开始打印
            mydataFresh.serialDataPrintFlag = true;
            button_save.enabled = false;
            button_print.text = qsTr("停止打印");
            myclassExposeByRegType.clearserialSaveAndApp();
            timer_print.start();


        }
    }

    Timer {

        id:timer_set_ultrasonic

        interval: 1000
//        running: true
        repeat: true
        triggeredOnStart: false
        onTriggered: {

            cnt_timer+=1;
            if(cnt_timer>=30)
            {
                timer_set_ultrasonic.stop();
                ultrasonicinfopage_tips.close();
                if(mydataFresh.serialDataPrintFlag == true){
                    mydataFresh.serialDataPrintFlag = false;
                    button_save.enabled = true;
                    button_print.text = qsTr("开始打印");
                    timer_print.stop();
                }
            }
        }
    }

    MyDataFresh{
        id:mydataFresh
    }

    Label {
        id: textEdit_read_ultrasonic_lowpassflilter
        x: 609
        y: 301
        width: 106
        height: 26
        text: qsTr("0")
        font.bold: true
        font.pixelSize: 30
    }

    Label {
        id: textEdit_read_ultrasonic_noflilter
        x: 608
        y: 244
        width: 86
        height: 26
        text: qsTr("0")
        font.bold: true
        font.pixelSize: 30
    }


    Label {
        id: label_read_ultrasonic_lowpassflilter
        x: 8
        y: 6
        width: 342
        height: 26
        text: qsTr("低通滤波的超声波测距（mm）：")
        font.bold: true
        anchors.centerIn: parent
        font.pixelSize: 30
        anchors.verticalCenterOffset: -226
        anchors.horizontalCenterOffset: -643
    }

    Label {
        id: label_read_ultrasonic_noflilter
        x: 4
        y: 10
        width: 336
        height: 32
        text: qsTr("没有滤波的超声波测距（mm）：")
        font.bold: true
        anchors.centerIn: parent
        font.pixelSize: 30
        anchors.horizontalCenterOffset: -646
        anchors.verticalCenterOffset: -280
    }


    Timer{
        interval: 300
        repeat: true
        triggeredOnStart: false
        running: true

        onTriggered: {

            if(myclassExposeByRegType.getCurrentPage() === 5)
            {
                textEdit_read_ultrasonic_lowpassflilter.text = myclassExposeByRegType.getHeigth_Ultrasonic_lowpass();
                textEdit_read_ultrasonic_noflilter.text = myclassExposeByRegType.getHeigth_Ultrasonic_nofliter();
                textEdit_read_ultrasonic_time.text = myclassExposeByRegType.getHeigth_Ultrasonic_time();
                textEdit_read_ultrasonic_lowpassflilter1.text = myclassExposeByRegType.getHeigth_Ultrasonic_alpha();
            }

        }
    }

    Rectangle {
        x:821
        y:124
        width: 583
        height: 400
        color: "#00000000"
        border.width: 1
    }



//    Component.onCompleted: {

//        myclassExposeByRegType.getPortInfo();
//        comboModel.setComboList(myclassExposeByRegType.receivePort());

//    }


    MyClassType
    {
        id:myclassExposeByRegType
    }

    RFSetPage{
        id:rfsetpage
    }

    UltrasonicProjectDevelopPage{
        id:ultrasonicprojectdeveloppage
    }

    UltrasonicInfoPage{
        id:ultrasonicinfopage
    }

    UltrasonicInfoPage_Tips{
        id:ultrasonicinfopage_tips
    }

    states: [
        State {
            name: "State1"
        },
        State {
            name: "State2"

            PropertyChanges {
                target: button_set_lab_acc
                x: 1329
                y: 599
            }
        }
    ]


    Button {
        id: button_print
        x: 834
        y: 472
        text: qsTr("开始打印")
        font.bold: true
        font.pointSize: 22
        visible: false
        onPressed: {
            if(mydataFresh.serialDataPrintFlag == true){
                mydataFresh.serialDataPrintFlag = false;
                button_save.enabled = true;
                button_print.text = qsTr("开始打印");
                timer_print.stop();
            }
            else{
                //开始打印
                mydataFresh.serialDataPrintFlag = true;
                button_save.enabled = false;
                button_print.text = qsTr("停止打印");
                myclassExposeByRegType.clearserialSaveAndApp();
                timer_print.start();
            }
        }

    }


    Button {
        id: button_save
        x: 1001
        y: 472
        text: qsTr("保存")
        font.bold: true
        font.pointSize: 22
        enabled: true

        onPressed: {
            mydataFresh.buttonSaveClick("\\Content_resource\\超声波模组\\数据保存\\", textArea.text);
            datasavecompletedw.show();
        }
    }

    DataSaveCompletedPage{
        id:datasavecompletedw
    }

    ScrollView {
        x: 841
        y: 139
        width: 546
        height: 327
        TextArea {
            id: textArea
            x: -3
            y: -6
            width: 546
            height: 319
            text: ""
            font.family: "Times New Roman"
            font.bold: true
            placeholderText: qsTr("超声波测距-数据保存与应用")
            font.pixelSize: 20
            readOnly: true
            selectByKeyboard: true
            selectByMouse: true
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


    Timer{
        id:timer_print
        interval: 1000
        repeat: true
        triggeredOnStart: false

        onTriggered: {

           if(myclassExposeByRegType.getCurrentPage() === 5)
           {
                textArea.text = myclassExposeByRegType.getserialSaveAndApp();
                textArea.cursorPosition = textArea.text.length;
           }
        }
    }

    Button {
        id: button_open
        x: 1148
        y: 472
        text: qsTr("打开保存文件夹")
        font.bold: true
        font.pointSize: 22
        enabled: true
        onPressed: {
            mydataFresh.buttonOpenFolderClick("\\Content_resource\\超声波模组\\数据保存\\");
        }
    }


    Label {
        id: label_set_lowpass_confficent
        x: -7
        y: 15
        width: 401
        height: 32
        text: qsTr("低通滤波系数（0.0001~0.9999）:")
        anchors.horizontalCenterOffset: -613
        font.bold: true
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -115
        font.pixelSize: 30
    }

    TextInput {
        id: textEdit_set_lowpass_confficent
        x: 626
        y: 409
        width: 71
        height: 38
        text: qsTr("0.9")
//        validator: IntValidator {
//            top: 0.9999
//            bottom: 0.0001
//        }
        clip: false
        font.bold: true
        focus: true
        font.pixelSize: 30
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

    Label {
        id: label_read_ultrasonic_lowpassflilter1
        x: 16
        y: 0
        width: 342
        height: 26
        text: qsTr("超声波从发送到接收时间（ms）：")
        font.bold: true
        anchors.horizontalCenterOffset: -643
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -333
        font.pixelSize: 30
    }

    Label {
        id: textEdit_read_ultrasonic_time
        x: 608
        y: 194
        width: 106
        height: 26
        text: qsTr("0")
        font.bold: true
        font.pixelSize: 30
    }

    Label {
        id: label_set_lowpass_confficent1
        x: -3
        y: 11
        width: 401
        height: 32
        text: qsTr("当前低通滤波系数:")
        anchors.verticalCenterOffset: -165
        font.bold: true
        anchors.horizontalCenterOffset: -613
        anchors.centerIn: parent
        font.pixelSize: 30
    }

    Label {
        id: textEdit_read_ultrasonic_lowpassflilter1
        x: 608
        y: 359
        width: 106
        height: 26
        text: qsTr("0.9")
        font.bold: true
        font.pixelSize: 30
    }

}
