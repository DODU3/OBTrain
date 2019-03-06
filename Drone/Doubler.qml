import QtQuick 2.9
import QtQuick.Controls 2.2
import QtWebEngine 1.0
import QtWebSockets 1.0
import QtWebChannel 1.0
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

    Label{
        id: label
        text: qsTr("折叠机")
        height: 80
        width: 240
        anchors.centerIn: parent
        font.pixelSize: 20
    }

}

