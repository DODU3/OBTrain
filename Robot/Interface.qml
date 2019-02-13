import QtQuick 2.9
import QtQuick.Controls 2.2
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
        text: qsTr("配件软硬接口")
        height: 80
        width: 240
        anchors.centerIn: parent
        font.pixelSize: 20
    }

//    Button {
//        height: 32
//        width: 120
//        text: qsTr("帐号")
//        anchors.right: parent.right
//        anchors.bottom: parent.bottom
//        onClicked: {
//            page3.visible = true;
//            page3.stack = stack;
//            stack.push(page3);
//        }
//    }

//    Page3 {
//        id: page3
//        visible: false
//        stack: stack
//    }

}

