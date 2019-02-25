import QtQuick 2.9
import QtMultimedia 5.4
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.2
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.0
import ".."


Page {
    width: 1920
    height: 1080

    background: Image {
        source: "../images/background.png"
    }


    property StackView stack: null

    Button {
        height: 32
        width: 120
        text: "<-"
        anchors.left: parent.left
        anchors.top: parent.top
        onClicked: stack.pop()
    }


    Column{
        y:32
        width: 1920
        height: 1080

        Rectangle{
            id:screen
            color:"black"
            anchors.fill: parent
//            width:kPlayer.width
//            height: kPlayer.height-50
//            Image{
//                id:img
////                source: "./Images/KPlayer.png"
//                anchors.fill: parent
//            }
            MediaPlayer{
                id:player
//                source: fd.fileUrl
                source: "file:///C:/Users/admin/Desktop/xx.MOV"
                autoPlay: false
                volume: 1.0
            }
            VideoOutput {
                anchors.fill: parent
                source: player
            }
        }

        Rectangle{
            y:600
            id:control
            color:"#80202020"
            border.color: "gray"
            border.width: 1
            width:parent.width
            height: 20
            Row{
                spacing: 50
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 10
                anchors.left: parent.left
                //调节播放速度
                Slider{
                    id:playPos
                    width: parent.width*0.75
                    height: 10
//                    maximumValue: player.duration
//                    minimumValue: 0
                    value:player.position
                    anchors.verticalCenter: parent.verticalCenter
                    stepSize:1000
//                    style {
//                        groove: Rectangle {
//                            width: kPlayer.width*0.8
//                            height: 8
//                            color: "gray"
//                            radius: 2
//                            Rectangle {
//                                anchors.left: parent.left
//                                anchors.top: parent.top
//                                anchors.bottom: parent.bottom
//                                width: player.duration>0?parent.width*player.position/player.duration:0
//                                color: "blue"
//                            }
//                        }
//                        handle: Rectangle {
//                            anchors.centerIn: parent
//                            color: control.pressed ? "white" : "darkgray"
//                            border.color: "gray"
//                            border.width: 2
//                            implicitWidth: 15
//                            implicitHeight: 15
//                            radius:7.5
//                            Rectangle{
//                                width: parent.width-8
//                                height: width
//                                radius: width/2
//                                color: "blue"
//                                anchors.centerIn: parent
//                            }
//                        }
//                    }
                    //点击鼠标设置播放位置
                    MouseArea {
                        property int pos
                        anchors.fill: parent
                        onClicked: {
                            if (player.seekable)
                                pos = player.duration * mouse.x/parent.width
                            player.seek(pos)
                            playPos.value=pos;
                        }
                    }
                }
                Image{
                    width: 15
                    height: 15
//                    source: "./Images/voice.png"
                    anchors.verticalCenter: parent.verticalCenter
                }
                //调节音量
                Slider{
                    id:voice
                    width: parent.width*0.2
                    height: 10
                    value:player.volume
                    stepSize: 0.1
//                    maximumValue: 1
//                    minimumValue: 0
                    anchors.verticalCenter: parent.verticalCenter
//                    style{
//                        groove: Rectangle {
//                            implicitWidth: kPlayer.width*0.2
//                            implicitHeight: 8
//                            color: "gray"
//                            radius: 2
//                            Rectangle {
//                                anchors.left: parent.left
//                                anchors.top: parent.top
//                                anchors.bottom: parent.bottom
//                                width: player.volume>0?parent.width*player.volume:0
//                                color: "blue"
//                            }
//                        }
//                        handle: Rectangle {
//                            anchors.centerIn: parent
//                            color: control.pressed ? "white" : "darkgray"
//                            border.color: "gray"
//                            border.width: 2
//                            implicitWidth: 15
//                            implicitHeight: 15
//                            radius:7.5
//                            Rectangle{
//                                width: parent.width-8
//                                height: width
//                                radius: width/2
//                                color: "blue"
//                                anchors.centerIn: parent
//                            }
//                        }
//                    }
                }
            }
        }
        //控制区域
        Rectangle{
            y:620
            id:bottom
            color:"#80202020"
            border.color: "gray"
            border.width: 1
            width: parent.width
            height: 30
            Row{
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 10
                spacing: 10
                Button{
                    width: 100
                    height: 30
                    property int status: 0  //默认播放
                    text:"开始";
//                    iconImage: "./Images/pause.png"
                    onClicked: {
                        if(status===1)
                        {
                            player.pause();
                            text="开始";
                            console.log("start")
                            status=0;
//                            iconImage="./Images/play.png"
                        }
                        else{
                            player.play() ;
                            text="暂停";
                            console.log("pause")
                            status=1;
//                            iconImage="./Images/pause.png"
                        }
                    }
                }
                Button{
                    width: 100
                    height: 30
                    onClicked: player.stop()
                    text: "停止"
//                    iconImage: "./Images/stop.png"
                }
                //快进快退10s
                Button{
                    width: 100
                    height: 30
                    onClicked: player.seek(player.position+10000)
                    text: "快退"
//                    iconImage: "./Images/back.png"
                }
                Button{
                    width: 100
                    height: 30
                    onClicked: player.seek(player.position-10000)
                    text: "快进"
//                    iconImage: "./Images/pass.png"
                }
                Button{
                    width: 100
                    height: 30
                    text: "打开文件"
                    onClicked: fd.open()

                    FileDialog{
                        id:fd
                        nameFilters: ["Vedio Files(*.avi *.mp4 *rmvb *.rm)"]  //格式过滤
                        selectMultiple: false
                    }
                }


                Text{
                    anchors.verticalCenter: parent.verticalCenter
                    text:parent.currentTime(player.position)+"/"+parent.currentTime(player.duration)
                    color: "white"
                }
                //时间格式化
                function currentTime(time)
                {
                    var sec= Math.floor(time/1000);
                    var hours=Math.floor(sec/3600);
                    var minutes=Math.floor((sec-hours*3600)/60);
                    var seconds=sec-hours*3600-minutes*60;
                    var hh,mm,ss;
                    if(hours.toString().length<2)
                        hh="0"+hours.toString();
                    else
                        hh=hours.toString();
                    if(minutes.toString().length<2)
                        mm="0"+minutes.toString();
                    else
                        mm=minutes.toString();
                    if(seconds.toString().length<2)
                        ss="0"+seconds.toString();
                    else
                        ss=seconds.toString();
                    return hh+":"+mm+":"+ss
                }
            }
        }

    }

}
