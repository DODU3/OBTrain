import QtQuick 2.9
import QtQuick.Controls 2.2
import ".."

Page {


    property StackView stack: null

    background: Image {
        source: "../../images/background.png"
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
        text: qsTr("激光雷达")
        height: 80
        width: 240
        anchors.centerIn: parent
        font.pixelSize: 20
    }

}

