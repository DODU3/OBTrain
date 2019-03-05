import QtQuick 2.9
import QtQuick.Controls 2.2
import QtWebEngine 1.0
import QtWebSockets 1.0
import ".."

import "../test.js" as Code

Page {

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

    WebEngineView {
        x: 0
        y: 80
        width: 1360;
        height: 720;
        url: "../module/blockly/dobots/index.html"
    }

    Button {
        id: button
        x: 174
        y: 34
        text: qsTr("Button")

        onClicked: {
            var xxxx;
            xxxx = Code.func();
            console.log("xxxx:"+xxxx);
           // qDebug() << "xxx:" <<xxxx;
        }
    }


}

