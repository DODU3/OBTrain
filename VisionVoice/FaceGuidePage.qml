import QtQuick 2.9
import QtQuick.Controls 2.2
import ".."

Page {
    id: page


    property StackView stack: null

    width: 1920
    height: 1080

    background: Image {
        source: "./images/FaceGuidePage.png"
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
        x: 1433
        y: 850
        width: 187
        height: 56
        text: qsTr("继续>>>>")
        font.family: "华文楷体"
        display: AbstractButton.TextBesideIcon
        anchors.right: parent.horizontalCenter
        anchors.rightMargin: -660
        anchors.bottom: parent.verticalCenter
        anchors.bottomMargin: -366
        spacing: 7
        font.pixelSize: 35
        focusPolicy: Qt.NoFocus
        onClicked: {
            stack.pop();
            pageFace.stack = stack;
            stack.push(pageFace);
        }
    }

    Face {
        id: pageFace
        visible: false
        stack: stack
    }


}

