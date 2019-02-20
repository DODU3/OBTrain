import QtQuick 2.9
import QtQuick.Controls 2.2
import "../../Component"
import "./"

import RegisterMyType 1.0
import RegisterSystemOpen 1.0

Page {
    id: page

    property StackView stack: null

    background: Image {
        source: "../../images/background.png"
    }

    MySystemOpen
    {
        id:system_open_visual_program
    }

    Button {
        id:back
        height: 32
        width: 120
        text: "<-"
        anchors.left: parent.left
        anchors.top: parent.top
        onClicked: stack.pop()
    }

    Label{
        id: label
        width: 240
        text: qsTr("视觉算法例程")
        anchors.left: back.right
        anchors.leftMargin: 3
        anchors.top: back.bottom
        anchors.topMargin: 28
        height: 26
        font.pixelSize: 20
    }

    Button {
        id: camera_connect
        width: 106
        height: 40
        text: qsTr("图传连接")
        anchors.left: label.left
        anchors.leftMargin: 0
        anchors.top: label.bottom
        anchors.topMargin: 22

//        MouseArea{
//            id:mouseProjectArea
//            anchors.fill: parent
//            onPressed: {
//                system_open_visual_program.openProject()
//            }
//        }
    }

    Button {
        id: person_detection
        width: 106
        height: 40
        text: qsTr("人体检测算法")
        anchors.left: label.left
        anchors.leftMargin: 0
        anchors.top: posture_recoginition.bottom
        anchors.topMargin: 25

        MouseArea{
            id:person_project
            anchors.fill: parent
            onPressed: {
                system_open_visual_program.openHuman()
            }
        }
    }

    Button {
        id: camera_connect_teaching
        y: 108
        width: 166
        height: 40
        text: qsTr("图传连接教程")
        anchors.left: camera_connect.right
        anchors.leftMargin: 28

        /*MouseArea{
            id:mouseVideo1Area
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.fill: parent
            onPressed: {
                page2.visible = true;
                page2.stack = stack;
                stack.push(page2);
            }
        }*/
    }

    Button {
        id: visual_tracking
        text: qsTr("视觉跟踪算法")
        anchors.left: label.left
        anchors.leftMargin: 0
        anchors.top: camera_connect.bottom
        anchors.topMargin: 25

        MouseArea{
            id:tracking_project
            anchors.fill: parent
            onPressed: {
                system_open_visual_program.openKCF()
            }
        }
    }

    Button {
        id: posture_recoginition
        text: qsTr("姿态识别算法")
        anchors.left: label.left
        anchors.leftMargin: 0
        anchors.top: visual_tracking.bottom
        anchors.topMargin: 25

        MouseArea{
            id:posture_project
            anchors.fill: parent
            onPressed: {
                system_open_visual_program.openPosture()
            }
        }
    }

    Button {
        id: tracking_teaching
        text: qsTr("视觉跟踪算法使用教程")
        anchors.left: camera_connect_teaching.left
        anchors.leftMargin: 0
        anchors.top: camera_connect_teaching.bottom
        anchors.topMargin: 25

        MouseArea{
            id:tracking_teaching_page
            anchors.fill: parent
            onPressed: {
                page21.visible = true;
                page21.stack = stack;
                stack.push(page21);
            }
        }
    }

    Button {
        id: posture_teaching
        text: qsTr("姿态识别算法使用教程")
        anchors.left: camera_connect_teaching.left
        anchors.leftMargin: 0
        anchors.top: tracking_teaching.bottom
        anchors.topMargin: 25

        MouseArea{
            id:posture_teaching_page
            anchors.fill: parent
            onPressed: {
                page22.visible = true;
                page22.stack = stack;
                stack.push(page22);
            }
        }
    }

    Tracking_Teaching{
        id:page21
        visible: false
        stack: stack
    }

    Posture_Teaching{
        id:page22
        visible: false
        stack: stack
    }
}
