import QtQuick 2.9
import QtQuick.Controls 2.2

//import QtMultimedia 5.4

import ".."
import "../../Component"
//import "./PresentPage"
import "./BaroPage"
import "./UartData"

import RegisterMyType 1.0
import RegisterSystemOpen 1.0
import RegisterDataFresh 1.0

Page {

    width: 1920
    height: 1080

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
            baroinfopage.show();
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
            baroprojectdeveloppage.active;
            baroprojectdeveloppage.show();
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

//    Rectangle {
//        x:1313
//        y:137
//        width: 402
//        height: 750
//        color: "#00000000"
//        border.width: 1

//        BaroDataApplicatePage{
//            id:barodataapplicatepage
//            x:2
//            y:2
//            width: 400
//            height: 740
//        }
//    }

//    Component.onCompleted: {

//        myclassExposeByRegType.getPortInfo();
//        comboModel.setComboList(myclassExposeByRegType.receivePort());
//        //        console.log(positionSource.position.coordinate.latitude,
//        //                    positionSource.position.coordinate.longitude)
//    }

    MyClassType
    {
        id:myclassExposeByRegType
    }

    RFSetPage{
        id:rfsetpage
    }

    BaroProjectDevelopPage{
        id:baroprojectdeveloppage
    }

    BaroInfoPage{
        id:baroinfopage
    }

    Text {
        id: labelHeight1
        x: 340
        y: 243
        width: 247
        height: 40
        text: qsTr("滤波前当前气压值(Pa)：")
        font.pointSize: 22
        font.bold: true
    }

    Text {
        id: tpressure
        x: 671
        y: 243
        width: 64
        height: 31
        text: qsTr("0")
        font.bold: true
        font.pointSize: 22
    }

    Timer {
        interval: 500
        repeat: true
        triggeredOnStart: false
        running: true
        onTriggered: {
            if(myclassExposeByRegType.getCurrentPage() === 4)
            {
                tpressure.text = myclassExposeByRegType.getpressureRaw();
                tpressure2.text = myclassExposeByRegType.getpressureFilter();
                tpressure3.text = myclassExposeByRegType.getSlideDepth();
                tpressure4.text = myclassExposeByRegType.getpressureHeight();
            }
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

    Text {
        id: labelHeight2
        x: 340
        y: 507
        width: 247
        height: 40
        text: qsTr("设定滑动平均滤波N：")
        font.bold: true
        font.pointSize: 22
    }

    Slider {
        id: slider
        x: 138
        y: 634
        width: 1060
        height: 40
        value: 8
        from: 1
        to: 100
        stepSize: 1
        onValueChanged: {
            tpressure1.text = slider.value
        }
    }

    Button {
        id: buttonprint
        x: 663
        y: 706
        text: qsTr("开始实验")
        font.bold: true
        font.pointSize: 22

        onPressed: {
            barometerinfopage_tips.show();
            cnt_timer=0;
            timer_set_barometer.start();

            //开始打印
            mydataFresh.serialDataPrintFlag = true;
            buttonsave.enabled = false;

            buttonprint.enabled = false;
            myclassExposeByRegType.clearserialSaveAndApp();
            timer1.start();


        }

    }


    Button {
        id: buttonsave
        x: 1290
        y: 687
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
        x: 1290
        y: 67
        width: 400
        height: 600
        TextArea {
            id: textArea
            x: -10
            y: -6
            width: 400
            height: 597
//            text: "气压计-数据保存与应用"
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

    MyDataFresh{
        id:mydataFresh
    }

    Timer{
        id:timer1
        interval: 1000
        repeat: true
        triggeredOnStart: false

        onTriggered: {
            if(myclassExposeByRegType.getCurrentPage() === 4)
            {
                textArea.text = myclassExposeByRegType.getserialSaveAndApp();
                textArea.cursorPosition = textArea.text.length;
            }

        }
    }

    Button {
        id: buttonopenfolder
        x: 1425
        y: 687
        text: qsTr("打开保存文件夹")
        font.bold: true
        font.pointSize: 22
        enabled: true
        onPressed: {
            mydataFresh.buttonOpenFolderClick("\\Content_resource\\气压计模组\\数据保存\\");
        }
    }

    Text {
        id: tpressure1
        x: 671
        y: 507
        width: 64
        height: 31
        text: qsTr("8")
        font.bold: true
        font.pointSize: 22
    }

    Button {
        id: buttonsave1
        x: 290
        y: 706
        text: qsTr("设置滤波器")
        font.bold: true
        font.pointSize: 22
        enabled: true
        onPressed: {
            myclassExposeByRegType.setBaroSlideDepth(slider.value);
        }
    }

    Text {
        id: labelHeight3
        x: 340
        y: 333
        width: 247
        height: 40
        text: qsTr("滤波后当前气压值(Pa)：")
        font.bold: true
        font.pointSize: 22
    }

    Text {
        id: tpressure2
        x: 671
        y: 333
        width: 64
        height: 31
        text: qsTr("0")
        font.bold: true
        font.pointSize: 22
    }

    Text {
        id: labelHeight4
        x: 340
        y: 424
        width: 247
        height: 40
        text: qsTr("当前滑动平均滤波N：")
        font.bold: true
        font.pointSize: 22
    }

    Text {
        id: tpressure3
        x: 671
        y: 424
        width: 64
        height: 31
        text: qsTr("8")
        font.bold: true
        font.pointSize: 22
    }

    Timer {

        id:timer_set_barometer

        interval: 1000
//        running: true
        repeat: true
        triggeredOnStart: false
        onTriggered: {

            cnt_timer+=1;
            if(cnt_timer>=15)
            {
                timer_set_barometer.stop();
                barometerinfopage_tips.close();
                if(mydataFresh.serialDataPrintFlag == true){
                    mydataFresh.serialDataPrintFlag = false;
                    buttonsave.enabled = true;
                    buttonprint.enabled = true;
                    timer1.stop();
                }
            }
        }
    }

    BarometerInfoPage_Tips{
        id:barometerinfopage_tips
    }

    Button {
        id: button3
        x: 821
        y: 163
        text: qsTr("相对高度复位")
        font.bold: true
        font.pointSize: 22
        onClicked:
        {
            myclassExposeByRegType.sendCMD("27", "808080800800", "0000000000000000");
        }
    }

    Text {
        id: labelHeight5
        x: 340
        y: 168
        width: 330
        height: 40
        text: qsTr("相对高度值(cm)：")
        font.bold: true
        font.pointSize: 22
    }

    Text {
        id: tpressure4
        x: 676
        y: 168
        width: 64
        height: 31
        text: qsTr("0")
        font.bold: true
        font.pointSize: 22
    }
}

