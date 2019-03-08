import QtQuick 2.9
import QtQuick.Controls 2.2

import RegisterSystemOpen 1.0

ApplicationWindow {
    id: gpsInfoPage
    x: 0
    y: 0
    width: 600
    height: 100
    maximumHeight:100
    minimumHeight:100
    maximumWidth:600
    minimumWidth:600

    title: "GPS-教学资料"

    background: Image {
        source: "../../../images/background.png"
    }

    Button {
        id: button_openppt
        x: 56
        y: 30
        text: qsTr("教学PPT")
        font.bold: true
        font.pointSize: 20

        onClicked:
        {
            mySystemOpenReg.openFile("/Content resource/GPS模组/教学资料/教学PPT/GPS模组PPT.pptx");
        }
    }


    MySystemOpen
    {
        id:mySystemOpenReg
    }

    Button {
        id: button_openvideo
        x: 225
        y: 30
        text: qsTr("教学视频")
        font.bold: true
        font.pointSize: 20
        MouseArea {
            id: mouse_openvideo
            anchors.leftMargin: 0
            anchors.topMargin: 1
            anchors.rightMargin: 0
            anchors.fill: parent
            anchors.bottomMargin: -1
            onPressed: {
                mySystemOpenReg.openFile("/Content resource/GPS模组/教学资料/教学视频");
            }
        }
    }

        Button {
            id: button_openotherfile
            x: 405
            y: 30
            text: qsTr("其他资料")
            font.bold: true
            font.pointSize: 20
            MouseArea {
                id: mouse_openotherfile
                anchors.leftMargin: 0
                anchors.topMargin: -1
                anchors.rightMargin: 0
                anchors.fill: parent
                anchors.bottomMargin: 1
                onPressed: {
                    mySystemOpenReg.openFile("/Content resource/GPS模组/教学资料/其他资料");
                }
            }
        }

}
