
import QtQuick 2.9
import QtQuick.Controls 2.2

import RegisterSystemOpen 1.0

ApplicationWindow {
    id: ultrasonicprojectdeveloppage
    x: 0
    y: 0
    width: 480
    height: 100
    maximumHeight:100
    minimumHeight:100
    maximumWidth:480
    minimumWidth:480

    title: "超声波-工程实例"

    background: Image {
        source: "../../../images/background.png"
    }

    Button {
        id: button_openproject
        x: 57
        y: 25
        text: qsTr("Demo工程")
        font.bold: true
        font.pointSize: 20

        onClicked:
        {
            mySystemOpenReg.openFile("/Content_resource/超声波模组/Demo_Project/Drone_Templates/Projects/Project.uvprojx");
        }

    }


    MySystemOpen
    {
        id:mySystemOpenReg
    }

    Button {
        id: button_openvideo
        x: 241
        y: 25
        text: qsTr("开发操作视频")
        font.bold: true
        font.pointSize: 20
        MouseArea {
            id: mouse_openvideo
            anchors.leftMargin: 1
            anchors.topMargin: 2
            anchors.rightMargin: -1
            anchors.fill: parent
            anchors.bottomMargin: -2
            onPressed: {
                mySystemOpenReg.openFile("/Content_resource/超声波模组/教学资料/教学视频/开发操作视频.mp4");
            }
        }
    }

}
