import QtQuick 2.9
import QtQuick.Controls 2.2
import QtWebEngine 1.1
import QtWebSockets 1.0
import QtWebChannel 1.0
import QtWebView 1.1
import ".."
import QtQuick.Window 2.0

import "../Component"

import io.decovar.WebSocketTransport 1.0

import RegisterJsApiObject 1.0

import "../test.js" as Code
//import "../test.js" as test
import QtQuick.Dialogs 1.2
import liam.Openfile 1.0
Page {

    MyJsApiObject{
        id:myJsApiObject

        WebChannel.id: "jsApi"
        function saveBlockly(path,saveText) {
            console.log("save text:"+saveText);
            console.log("save path:"+path);
            openxblocklyfile.savefile(path,saveText);//readfile一定要小写
        }
    }

    function func(xxx123) {
        'use strict';
    //    var code = '(function(){ return this; }())';

    //    var result = eval.call( null, code );

        //console.log(window.eval(xxx123)); // true sloppy mode

//        var sl = new Function(xxx123);
//        console.log(sl() !== undefined); // true, sloppy mode
//        console.log("xxxx:"+xxx123);

//        try {
//            var value = eval(xxx123);
//        }
//        catch (error) {
//            throw new Error("Could not get value of " + xxx123 + " (" + error.message + ")");
//        }


        print("xxxx");
    }


    property StackView stack: null

    background: Image {
        source: "../images/background.png"
    }

    Openfile {
        id: openxblocklyfile
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

    Window
    {
        x: 100
        y: 100
        width: 100
        height: 100


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
        x: 777
        y: 77
        font.bold: true
        font.pointSize: 20

        model:comboModel.comboList

    }

    QmlToggleButton{
        id: qmlToggleButton
        anchors.centerIn: parent
        x: 850
        y: 77
        height: 40
        radius: 20
        anchors.verticalCenterOffset: -443
        anchors.horizontalCenterOffset: 46

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
            if(openxblocklyfile.getfilename().length>2)
            {
                 console.log("just save")
                 myJsApiObject.onSave(openxblocklyfile.getfilename());//直接保存好，再新建
            }

            openxblocklyfile.setfilename("");
            myJsApiObject.onClear("new")
        }
    }

    Button {
        id: button1
        x: 157
        y: 77
        text: qsTr("打开")
        onPressed:
        {
            console.log("qml open")
            fds.open();

        }
    }


    FileDialog {
           id:savefile
           title: "保存文件"
           folder: shortcuts.desktop
           selectExisting: false
           selectFolder: false
           selectMultiple: false
           nameFilters: ["blockly文件 (*.blockly)"]
           onAccepted: {
               var path = savefile.fileUrl.toString();
               path = path.replace(/^(file:\/{3})/,"");
               console.log(path);
                openxblocklyfile.setfilename(path);
               //发送信号，得到web送过来的xml text数据,然后再调用C++保存。
                myJsApiObject.onSave(path);
           }

           onRejected: {
              // labels.text = "";
               console.log("Canceled");
               Qt.quit();
           }
    }

    FileDialog {
           id:fds
           title: "打开文件"
           folder: shortcuts.desktop
           selectExisting: true
           selectFolder: false
           selectMultiple: false
           nameFilters: ["json文件 (*.blockly)"]
           onAccepted: {

               console.log("You chose: " + fds.fileUrl);
               var path = fds.fileUrl.toString();
               path = path.replace(/^(file:\/{3})/,"");
               console.log(path)
               openxblocklyfile.setfilename(path);
              var senddata= openxblocklyfile.readfile(path);//readfile一定要小写

              // console.log()
               myJsApiObject.onOpen(senddata);
           }

           onRejected: {
              // labels.text = "";
               console.log("Canceled");
               Qt.quit();
           }
    }

    Button {
        id: button2
        x: 269
        y: 77
        text: qsTr("存储")
        onPressed:
        {
            if(openxblocklyfile.getfilename().length>2)
            {
                 console.log("just save")
                 someObject.onSave(openxblocklyfile.getfilename());//直接保存
            }
            else
            {
                 console.log("begin save")
                  savefile.open();
            }
        }
    }

    Button {
        id: button3
        x: 384
        y: 77
        text: qsTr("另存为")
        onPressed:
        {
            console.log("saveas save")
            savefile.open();
        }
    }

    Button {
        id: button4
        x: 537
        y: 77
        text: qsTr("开始")

        onClicked: {
//            myJsApiObject.jsOnstart();
            func(myJsApiObject.Code);
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

