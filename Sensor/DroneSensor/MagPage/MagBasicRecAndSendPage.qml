import QtQuick 2.9
import QtQuick.Controls 2.2

//import RegisterSerialTest 1.0
//import RegisterMyType 1.0

ApplicationWindow {
    id: magBasicRecAndSendPage

    width: 800
    height: 600

    title: "磁力计-基本收发"


    ScrollView {
        x: 72
        y: 66
        width: 526
        height: 432
        TextArea {
            id: textArea
            //objectName: "MagBasicRecAndSendText"
            placeholderText: qsTr("data")
//            text: myserialtest.receivedata
            font.pixelSize: 15
            readOnly: true
            selectByKeyboard: true
            selectByMouse: true
        }
    }

//    MySerialTest
//    {
//        id:myserialtest
//    }

    Timer{
        id:timer1
        interval: 200
        repeat: true
        triggeredOnStart: false

        onTriggered: {

            textArea.text = myclassExposeByRegType.getSerialDataAll()
            textArea.cursorPosition = textArea.text.length;
        }
    }

    Component.onCompleted: {
        timer1.start();
    }
}
