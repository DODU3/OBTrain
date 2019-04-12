import QtQuick 2.9
import QtQuick.Controls 2.2

import RegisterSystemOpen 1.0

ApplicationWindow {
    id: barometerInfoPage_tips
    x: 900
    y: 400
    width: 400
    height: 100
    maximumHeight:100
    minimumHeight:100
    maximumWidth:400
    minimumWidth:400

    title: "气压计-消息提示"

    background: Image {
        source: "../../../images/background.png"
    }

    Label{
        id: label
        text: qsTr("实验自动操作中，请稍后...")
        font.bold: true
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: -5
        height: 38
        width: 390
        anchors.centerIn: parent
        font.pixelSize: 30
    }

}
