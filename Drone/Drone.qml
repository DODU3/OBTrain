import QtQuick 2.9
import QtQuick.Controls 2.2
import QtWebEngine 1.1
import QtWebSockets 1.0
import QtWebChannel 1.0
import QtWebView 1.1
import ".."

import "../Component"

import io.decovar.WebSocketTransport 1.0

import RegisterJsApiObject 1.0

//import "../test.js" as test

Page {

    MyJsApiObject{
        id:myJsApiObject

        WebChannel.id: "jsApi"

    }

    property StackView stack: null

    background: Image {
        source: "../images/background.png"
    }

    Button {
        height: 32
        width: 120
        text: "<-"
        anchors.left: parent.left
        anchors.top: parent.top
        onClicked: stack.pop()
    }

    Text {
        id: codeText
        x: 1479
        y: 583
        width: 353
        height: 364
        text: myJsApiObject.Code
        font.pointSize: 15
    }

    Text {
        id: logText
        x: 1479
        y: 153
        width: 353
        height: 364
        text: myJsApiObject.Log
        lineHeight: 1
        font.pointSize: 15


        Text {
            id: element1
            x: 0
            y: 404
            width: 75
            height: 20
            text: qsTr("General Code")
            font.pixelSize: 18
        }
    }

    ComboBox {
        id: comboBox
        objectName: "portComboBox"
        x: 261
        y: 18
        font.bold: true
        font.pointSize: 20

        model:comboModel.comboList
//        model: portlistmodel

//        pressed: true
//        down: true

//        MouseArea{
//            onPressed: {
//                console.info("aa");
//                myclassExposeByRegType.getPortInfo();
//                comboModel.setComboList(myclassExposeByRegType.receivePort());
//            }
//        }
//        onActivated: {
//            console.info("aa");
//        }

    }

    QmlToggleButton{
        id: qmlToggleButton
        anchors.centerIn: parent
        x: 140
        y: 18
        height: 40
        radius: 20
        anchors.verticalCenterOffset: -502
        anchors.horizontalCenterOffset: -446

        border.width: 1
        width: 106
//        leftString: qsTr("打开")
//        rightString: qsTr("关闭")

//        onToggleLeft: label.text = qmlToggleButton.leftString
//        onToggleRight: label.text = qmlToggleButton.rightString
//        onToggleLeft: {
//            timerSend.start();
//        }

//        onToggleRight: {
//            timerSend.stop();
//        }


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
                    console.log("key liam:" + comboBox[key]);
                    portName = comboModel.getElement(comboBox[key]);

                    break;
                }
            }
            myclassExposeByRegType.openAndSetPort(portName,3,3,0,0,0);

        }
    }


    WebChannel {
        id: channel
        registeredObjects: [myJsApiObject]
    }

    WebEngineView {
        x: 0
        y: 138
        width: 1360;
        height: 720;
        webChannel: channel
        url: "../module/blockly/dobots/index.html"
    }

    WebSocketTransport {
        id: transport
    }

    WebSocketServer {
        id: server
        listen: true
        port: 12345
        onClientConnected: {
            console.log("connect:"+webSocket.status);
            if(webSocket.status === WebSocket.Open) {
                channel.connectTo(transport)
                webSocket.onTextMessageReceived.connect(transport.textMessageReceive)
                transport.onMessageChanged.connect(webSocket.sendTextMessage)

            }
        }
        onErrorStringChanged: {
            console.log(qsTr("Server error: %1").arg(errorString));
        }
            Component.onCompleted: {
                console.log(server.url);
            }
    }



    Button {
        id: button
        x: 51
        y: 77
        text: qsTr("新建")

        onClicked: {
        }
    }

    Button {
        id: button1
        x: 157
        y: 77
        text: qsTr("打开")
        onPressed:
        {

        }
    }

    Button {
        id: button2
        x: 269
        y: 77
        text: qsTr("存储")
    }

    Button {
        id: button3
        x: 384
        y: 77
        text: qsTr("另存为")
    }

    Button {
        id: button4
        x: 537
        y: 77
        text: qsTr("开始")

        onClicked: {
            myJsApiObject.jsOnstart();
        }
    }

    Button {
        id: button5
        x: 643
        y: 77
        text: qsTr("结束")
    }

    Text {
        id: element
        x: 1479
        y: 125
        width: 107
        height: 22
        text: qsTr("Run Log")
        font.pixelSize: 18
    }

    Component.onCompleted: {

    }


}

