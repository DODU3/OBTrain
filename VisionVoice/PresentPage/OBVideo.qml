import QtQuick 2.9
import QtQuick.Controls 2.2

import QtMultimedia 5.4
import ".."

import RegisterMyType 1.0
import RegisterSystemOpen 1.0

Page {

    property StackView stack: null

    background: Image {
         source: "../../../images/background.png"
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
        text: qsTr("OB图传")
        anchors.verticalCenterOffset: -249
        anchors.horizontalCenterOffset: -83
        height: 26
        width: 86
        anchors.centerIn: parent
        font.pixelSize: 20
    }

    Image {
        id: image
        x: 147
        y: 134
        width: 405
        height: 221
        source: "../images/battery.jpg"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: image1
        x: 523
        y: 134
        width: 397
        height: 221
        source: "../images/videoModule.jpg"
        fillMode: Image.PreserveAspectFit
    }

    Text {
        id: element
        x: 271
        y: 372
        width: 32
        height: 20
        text: qsTr("电池")
        font.pixelSize: 16
    }

    Text {
        id: element1
        x: 654
        y: 372
        text: qsTr("图传模块")
        font.pixelSize: 16
    }

    MouseArea{
        x: 460
        y: 407
           // anchors.centerIn: parent
            width: hp.width
            height: hp.height
            hoverEnabled: true
            cursorShape: containsMouse ? (pressed ? Qt.ClosedHandCursor : Qt.OpenHandCursor) : Qt.ArrowCursor

            Text {
                id: hp
                text: "<a href='http://www.baidu.com'><h1>使用教程（视频）</h1></a>"
                anchors.centerIn: parent
                onLinkActivated: Qt.openUrlExternally(link)
            }
        }


//    Button {
//        id: button
//        x: 460
//        y: 407
//        text: qsTr("使用教程")
//        font.pixelSize: 16
//    }

//    Text {
//        id: element2
//        x: 554
//        y: 422
//        text: qsTr("（视频）")
//        font.pixelSize: 14
//    }



}








/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
