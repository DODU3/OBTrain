import QtQuick 2.9
import QtQuick.Controls 2.2
import QtWebEngine 1.0
import ".."

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
        url: "E:/project/OBTrain/blockly/dobots/index.html"
    }

}

