import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2
import "../../Component"
import ".."
import "./UartData"
import "./AccPage"


import RegisterMyType 1.0
import RegisterDataFresh 1.0

Page {
    id: page


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
            accinfopage.show();
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
            accprojectdeveloppage.active;
            accprojectdeveloppage.show();
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

    Button {
        id: button_reset_lab
        x: 132
        y: 568
        text: qsTr("实验1-1：实验台复位")
        font.bold: true
        font.pointSize: 22
        onClicked:
        {
            myclassExposeByRegType.sendCMD("27", "808080800800", "0000000000000000");
        }
    }

    Button {
        id: button_cal_acc
        x: 132
        y: 623
        text: qsTr("实验1-2：加速度计校准")
        font.bold: true
        font.pointSize: 22

        onClicked:
        {
            myclassExposeByRegType.sendCMD("01", "808080800800", "0000000000000000");
        }
    }


    TextInput {
        id: textEdit_set_lab_angle_X
        x: 598
        y: 680
        width: 71
        height: 38
        text: qsTr("0")
        clip: false
        font.bold: true
        font.pixelSize: 30
        validator: IntValidator{bottom: -85; top: 85;}
        focus: true
    }


    Button {
        id: button_set_lab_angle_X
        x: 132
        y: 677
        text: qsTr("实验1-3：设置实验台角度（°）")
        font.bold: true
        font.pointSize: 22

        onClicked:
        {
            //myclassExposeByRegType.setMagCorner(0,textEdit_set_lab_angle_X.text);
            myclassExposeByRegType.setLabAngle(textEdit_set_lab_angle_X.text,"0");
        }
    }


    Button {
        id: button_set_lab_acc
        x: 821
        y: 568
        text: qsTr("实验2：运动加速度对角度测量的影响")
        font.bold: true
        font.pointSize: 22
        onPressed: {

            imuinfopage_tips.show();
            myclassExposeByRegType.sendCMD("27", "808080800800", "0000000000000000");
            cnt_timer=0;
            timer_set_lab_acc.start();

            //开始打印
            mydataFresh.serialDataPrintFlag = true;
            button_save.enabled = false;
            button_print.text = qsTr("停止打印");
            myclassExposeByRegType.clearserialSaveAndApp();
            timer_print.start();
        }
    }

    Timer {

        id:timer_set_lab_acc

        interval: 1000
//        running: true
        repeat: true
        triggeredOnStart: false
        onTriggered: {

            cnt_timer+=1;
            if(cnt_timer==3)
            {
                //myclassExposeByRegType.setMagCorner(180,0);
                myclassExposeByRegType.setPlatformYawAngle(200, 200);
            }
            else if(cnt_timer==7)
            {
                //myclassExposeByRegType.setMagCorner(0,0);
                myclassExposeByRegType.setPlatformYawAngle(0, 200);
            }
            else if(cnt_timer==11)
            {
                //myclassExposeByRegType.setMagCorner(180,0);
                myclassExposeByRegType.setPlatformYawAngle(200, 200);
            }
            else if(cnt_timer==15)
            {
                //myclassExposeByRegType.setMagCorner(0,0);
                myclassExposeByRegType.setPlatformYawAngle(0, 200);
            }
            else if(cnt_timer>=19)
            {
                timer_set_lab_acc.stop();
                imuinfopage_tips.close();
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

    Button {
        id: button_read_acc
        x: 132
        y: 730
        text: qsTr("实验1-4：获取三轴加速度计数据")
        font.bold: true
        font.pointSize: 22
        onPressed: {

            textEdit_read_acc_X.text = myclassExposeByRegType.getAccX();
            textEdit_read_acc_Y.text = myclassExposeByRegType.getAccY();
            textEdit_read_acc_Z.text = myclassExposeByRegType.getAccZ();
        }
    }

    Label {
        id: textEdit_read_acc_X
        x: 293
        y: 789
        width: 80
        height: 26
        text: qsTr("0")
        font.bold: true
        font.pixelSize: 30
    }

    Label {
        id: textEdit_read_acc_Y
        x: 293
        y: 841
        width: 86
        height: 26
        text: qsTr("0")
        font.bold: true
        font.pixelSize: 30
    }

    Label {
        id: textEdit_read_acc_Z
        x: 293
        y: 882
        width: 91
        height: 33
        text: qsTr("0")
        font.bold: true
        font.pixelSize: 30
    }


    Label {
        id: label_read_acc_X
        x: 8
        y: 6
        width: 122
        height: 26
        text: qsTr("X轴分量Ax：")
        font.bold: true
        anchors.centerIn: parent
        font.pixelSize: 30
        anchors.verticalCenterOffset: 262
        anchors.horizontalCenterOffset: -767
    }

    Label {
        id: label_read_acc_Y
        x: 4
        y: 10
        width: 120
        height: 32
        text: qsTr("Y轴分量Ay：")
        font.bold: true
        anchors.centerIn: parent
        font.pixelSize: 30
        anchors.horizontalCenterOffset: -768
        anchors.verticalCenterOffset: 311
    }

    Label {
        id: label_read_acc_Z
        x: -2
        y: 2
        width: 120
        height: 24
        text: qsTr("Z轴分量Az：")
        font.bold: true
        anchors.centerIn: parent
        font.pixelSize: 30
        anchors.verticalCenterOffset: 354
        anchors.horizontalCenterOffset: -768
    }


    Rectangle {
        x:821
        y:124
        width: 583
        height: 400
        color: "#00000000"
        border.width: 1

//        IMUDataApplicatePage{
//            id:imudataapplicatepage
//            x:4
//            y:2
//            width: 575
//            height: 390
//        }
    }



    Rectangle {
        //        id: page
        x: 132
        y: 131
        width: 400
        height: 400
        color: "#00000000"
        border.color: "black"

        IMU2D {
            id: myimu2d
            width: 400
            height: 400

        }
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

    AccProjectDevelopPage{
        id:accprojectdeveloppage
    }

    AccInfoPage{
        id:accinfopage
    }

    AccInfoPage_Tips{
        id:accinfopage_tips
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
            mydataFresh.buttonSaveClick("\\Content_resource\\IMU模组\\数据保存\\", textArea.text);
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
        height: 279
        TextArea {
            id: textArea
            x: -3
            y: -6
            width: 546
            height: 321
            text: ""
            font.family: "Times New Roman"
            font.bold: true
            placeholderText: qsTr("加速度计-三轴数据保存与应用")
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


    Timer{
        id:timer_print
        interval: 200
        repeat: true
        triggeredOnStart: false

        onTriggered: {

           if(myclassExposeByRegType.getCurrentPage() === 1)
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
            mydataFresh.buttonOpenFolderClick("\\Content_resource\\IMU模组\\数据保存\\");
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
}
