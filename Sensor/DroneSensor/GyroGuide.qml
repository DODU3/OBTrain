import QtQuick 2.9
import QtQuick.Controls 2.2
import ".."

Page {
    id: page


    property StackView stack: null

    width: 1920
    height: 1080

    background: Image {
        source: "./images/IMUGuidePage.jpg"
    }

    Button {
        height: 32
        width: 120
        text: "<-"
        anchors.left: parent.left
        anchors.top: parent.top
        onClicked: stack.pop()
    }

    Button {
        id: button
        x: 1505
        y: 841
        width: 185
        height: 63
        text: qsTr("继续>>>>")
        font.family: "华文楷体"
        display: AbstractButton.TextBesideIcon
        anchors.right: parent.horizontalCenter
        anchors.rightMargin: -730
        anchors.bottom: parent.verticalCenter
        anchors.bottomMargin: -364
        spacing: 7
        font.pixelSize: 35
        focusPolicy: Qt.NoFocus
        onClicked: {
            stack.pop();
            pageGyro.stack = stack;
            stack.push(pageGyro);
        }
    }

    Gyro {
        id: pageGyro
        visible: false
        stack: stack
    }


}

