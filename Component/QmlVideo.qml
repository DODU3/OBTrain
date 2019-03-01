import QtQuick 2.5

import XVideo 1.0

Rectangle {
    width: 1360
    height: 720

    XVideo{
        id:xvideo
        anchors.centerIn: parent;
        width: 1360;
        height: 720;
//        strVideoPath: "rtsp://192.168.2.10";//香港电视台直播流
    }

    property bool isPlaying: false;
    Rectangle {
        id: rectangle
        x: 341
        y: -85
        width: 132
        height: 41
//        color: "#ffffff"

        Text{
            id:btn_text;
            anchors.centerIn: parent;
            font.bold: true
            font.pointSize: 22
            text: isPlaying ? qsTr("停止播放") : qsTr("开始播放");
        }
        MouseArea{
            anchors.fill: parent;
            onClicked: {
                if (isPlaying)
                {

                    xvideo.stop();
                }
                else
                {
                    xvideo.startVideo("rtsp://192.168.2.10");
                }
                isPlaying = !isPlaying;
            }
        }
    }
}
