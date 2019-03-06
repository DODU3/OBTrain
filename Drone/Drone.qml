import QtQuick 2.9
import QtQuick.Controls 2.2
import QtWebEngine 1.1
import QtWebSockets 1.0
import QtWebChannel 1.0
import QtWebView 1.1
import ".."

//import "../test.js" as Code

import io.decovar.WebSocketTransport 1.0

Page {

    // 一個具有屬性、信號和方法的對象——就像任何普通的Qt對象一樣
    QtObject {
        id: someObject

        // ID，在这个ID下，这个对象在WebEngineView端是已知的
        WebChannel.id: "jsApi"

        property string someProperty: "Break on through to the other side"

        property string someLog: "LOG"

        property string someCode: "Code"

        function setCanStartWork(){

        }

        function generalLog(someLog){
            logText.text = someLog;
            return "New text length: " + someLog.length;
        }

        function generalCode(someCode){
            codeText.text = someCode;
            return "New text length: " + someCode.length;
        }

        function runBlockly(code){

        }

        function saveBlockly(name, txt){

        }

        function loadUrl(url){

        }

//        signal generalLog(string message);

        signal onStart();
        signal onSave(string name);
        signal onOpen(string str);
        signal onClear();
        signal onSetLang(string str);
        signal onBackup(string str);
        signal onUpdateHWVersion(string str);

        signal someSignal(string message);

        function changeText(newText) {
            txt.text = newText;
            return "New text length: " + newText.length;
        }
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
        text: someObject.someCode
        font.pointSize: 15
    }

    Text {
        id: logText
        x: 1479
        y: 153
        width: 353
        height: 364
        text: someObject.someLog
        font.pointSize: 15
    }


    WebChannel {
        id: channel
        registeredObjects: [someObject]
    }

    WebEngineView {
        x: 0
        y: 80
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
        x: 174
        y: 34
        text: qsTr("Button")

        onClicked: {

        }
    }


}

