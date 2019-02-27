/*******************************************************************************
* Copyright (c) 2014, Sergey Radionov <rsatom_gmail.com>
* All rights reserved.
*
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions are met:
*   1. Redistributions of source code must retain the above copyright notice,
*      this list of conditions and the following disclaimer.
*   2. Redistributions in binary form must reproduce the above copyright notice,
*      this list of conditions and the following disclaimer in the documentation
*      and/or other materials provided with the distribution.

* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
* AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
* THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
* ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS
* BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
* OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
* PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
* OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
* WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
* OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*******************************************************************************/

import QtQuick 2.1
import QtQuick.Layouts 1.0
import QmlVlc 0.1
import QtMultimedia 5.0

Rectangle {
    color: 'grey';
    VlcPlayer {
        id: vlcPlayer;
//        mrl: "rtsp://192.168.2.10";

    }
    VideoOutput {
        source: vlcPlayer;
        anchors.centerIn: parent;
        width: parent.width;
        height: parent.height;
        opacity: 0.9;
    }

    MouseArea {
        hoverEnabled: true
        anchors.fill: parent
        RowLayout {
            id: toolbar
            opacity: .55
            spacing: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
//            anchors.bottomMargin: parent.containsMouse ? spacing : -height
            anchors.bottomMargin:-height
            anchors.leftMargin: spacing * 1.5
            anchors.rightMargin: spacing * 1.5
           // Behavior on anchors.bottomMargin { PropertyAnimation { duration: 250} }
            Rectangle {
                height: 24
                width: height
                radius: width * 0.25
                color: 'black'
                border.width: 1
                border.color: 'white'
                Image {
                    source: vlcPlayer.playing ? "pause.png" : "play.png"
                    anchors.centerIn: parent
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if(vlcPlayer.playing){
                            vlcPlayer.stop()
                        }else{
                            vlcPlayer.play("rtsp://192.168.2.10")
                        }
                    }
                }
            }

        }
    }
}
