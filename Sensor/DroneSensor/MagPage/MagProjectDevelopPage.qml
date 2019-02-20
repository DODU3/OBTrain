
import QtQuick 2.9
import QtQuick.Controls 2.2

import RegisterSystemOpen 1.0

ApplicationWindow {
    id: magprojectdeveloppage
    x: 350
    y: 350
    width: 480
    height: 320

    title: "磁力计-工程实例"


    Button {
        id: button_openproject
        x: 111
        y: 135
        text: qsTr("Demo工程")

        MouseArea{
            id:mouse_openppt
            anchors.rightMargin: -1
            anchors.bottomMargin: 0
            anchors.leftMargin: 1
            anchors.topMargin: 0
            anchors.fill: parent
            onPressed: {
                mySystemOpenReg.openFile("/Content resource/磁力计模组/Demo_Mag/Drone_Templates/Projects/Project.uvprojx");
            }
        }
    }


    MySystemOpen
    {
        id:mySystemOpenReg
    }

    Button {
        id: button_openvideo
        x: 262
        y: 135
        text: qsTr("开发操作视频")
        MouseArea {
            id: mouse_openvideo
            anchors.leftMargin: 1
            anchors.topMargin: 0
            anchors.rightMargin: -1
            anchors.fill: parent
            anchors.bottomMargin: 0
            onPressed: {
                mySystemOpenReg.openFile("/Content resource/磁力计模组/教学资料/教学视频/开发操作视频.mp4");
            }
        }
    }

}
