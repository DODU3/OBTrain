import QtQuick 2.9
import QtQuick.Controls 2.2
import "./Drone"
import "./Sensor"
import "./Iot"
import "./Robot"
import "./VisionVoice"
import "./MachineLearn"

ApplicationWindow {
    id: xxxxxxxxxxxxxx
    visible: true
    width: 1920
    height: 1080
//    property alias page1Form: page1Form
    title: qsTr("人工智能科教培训平台")

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex




        ListModel { id: listModel }

        WorkerScript {
            id: worker
            source: "SerialPortRefresh.js"
        }

        Timer {
            id: timer
            interval: 2000; repeat: true
            running: true
            triggeredOnStart: true

            onTriggered: {
                var msg = {'action': 'appendCurrentTime', 'model': listModel};
                worker.sendMessage(msg);

            }
        }

        DronePage{

        }

        IotPage{

        }


        RobotPage{

        }

        VVPage{

        }

        MachineLearnPage{

        }

        SensorPage{

        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("无人机")
        }
        TabButton {
            text: qsTr("物联网")
        }

        TabButton {
            text: qsTr("机器人")
        }
        TabButton {
            text: qsTr("视觉语音")
        }

        TabButton {
            text: qsTr("机器学习")
        }
        TabButton {
            text: qsTr("传感模组")
        }
    }
}
