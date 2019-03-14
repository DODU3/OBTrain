import QtQuick 2.9
import QtQuick.Controls 2.2


ApplicationWindow {
    id: magcalibrationpage
    x: 0
    y: 0
    width: 300
    height: 100

    title: "电子罗盘正在校准。。。"

    property int timet: 44

    BusyIndicator {
        id: busyIndicator
        x: 98
        y: 0
        width: 105
        height: 100
        running: true

        Text {
            id: element
            text: timet.toString()
            anchors.right: parent.right
            anchors.rightMargin: 30
            anchors.left: parent.left
            anchors.leftMargin: 30
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 27
            anchors.top: parent.top
            anchors.topMargin: 27
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            font.pointSize: 30
        }
    }



}

/*##^## Designer {
    D{i:2;anchors_x:33;anchors_y:30}
}
 ##^##*/
