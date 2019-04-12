import QtQuick 2.9
import QtQuick.Controls 2.2

import RegisterMyType 1.0

Item {
    id: magBasicRecAndSendPage

    width: 450
    height: 400

//    title: "电子罗盘-基本收发"
//    background: Image {
//        source: "../../../images/background.png"
//    }

    ScrollView {
        width: 450
        height: 400


        TextArea {
            id: textArea
            x: -10
            y: 0
            width: 450
            height: 350
            text: "串口数据基本收发"
            font.bold: true
            //objectName: "MagBasicRecAndSendText"
            placeholderText: qsTr("串口数据基本收发")
            //            text: myserialtest.receivedata
            font.pixelSize: 20
            readOnly: true
            selectByKeyboard: true
            selectByMouse: true
        }
    }


    MyClassType
    {
        id:myclassExposeByRegType
    }

    Timer{
        id:timer1
        interval: 500
        repeat: true
        triggeredOnStart: false
        running: false

        onTriggered: {

            textArea.text = myclassExposeByRegType.getSerialDataAll()
            textArea.cursorPosition = textArea.text.length;
        }
    }

//    Component.onCompleted: {
////        timer1.start();
//    }
}
