import QtQuick 2.9
import QtQuick.Controls 2.2
import ".."
import "../../Component"

Page {
    width: 1280
    height: 740

    property StackView stack: null


    SwipeView {
        id: svMachineLearnContainer


        anchors.fill: parent

        background: Image {
            source: "../../../images/background.png"


        }


        SwipeViewPage {



            Button {
                height: 32
                width: 120
                text: "<-"
                anchors.left: parent.left
                anchors.top: parent.top
                onClicked: stack.pop()
            }

            BorderImage {

                x: 83
                y: 361
                width: 256
                height: 248
                source: "../images/mag1.png.jpg"
            }

            Text {

                x: 73
                y: 130
                width: 990
                height: 225
                text: qsTr(" 人脸识别，是基于人的脸部特征信息进行身份识别的一种生物识别技术。用摄像机或摄像头采集含有人脸的图像或视频流，并自动在图像中检测和跟踪人脸，进而对检测到的人脸进行脸部识别的一系列相关技术，通常也叫做人像识别、面部识别。
人脸识别可以归纳为以下三个过程：

人脸检测
人脸对齐
人脸对比")
                verticalAlignment: Text.AlignTop
                wrapMode: Text.WrapAnywhere
                elide: Text.ElideNone
                horizontalAlignment: Text.AlignLeft
                font.pixelSize: 26

            }

            Text {

                x: 73
                y: 61
                text: qsTr("人脸识别")
                font.pixelSize: 33
            }
        }

        SwipeViewPage {


            Button {
                height: 32
                width: 120
                text: "<-"
                anchors.left: parent.left
                anchors.top: parent.top
                onClicked: stack.pop()
            }

            BorderImage {
                x: 83
                y: 361
                width: 256
                height: 248
                source: "../images/earthMag.png"
            }

            Text {
                x: 73
                y: 130
                width: 990
                height: 225
                text: qsTr("    人脸检测（Face Detection），就是给一幅图像，找出图像中的所有人脸位置，通常用一个矩形框框起来，输入是一幅图像img，输出是若干个包含人脸的矩形框位置(x,y,w,h)，就像这样：")
                verticalAlignment: Text.AlignTop
                wrapMode: Text.WrapAnywhere
                elide: Text.ElideNone
                horizontalAlignment: Text.AlignLeft
                font.pixelSize: 26
            }
            Image {
                id: image
                x: 323
                y: 244
                width: 559
                height: 365
                fillMode: Image.PreserveAspectFit
                source: "../images/face1.jpg"
            }

            Text {
                id: element1
                x: 73
                y: 61
                text: qsTr("人脸检测")
                font.pixelSize: 33
            }
        }




        SwipeViewPage {



            Button {
                height: 32
                width: 120
                text: "<-"
                anchors.left: parent.left
                anchors.top: parent.top
                onClicked: stack.pop()
            }

            BorderImage {

                x: 83
                y: 361
                width: 256
                height: 248
                source: "../images/magVerify.png"
            }

            Text {

                x: 73
                y: 130
                width: 990
                height: 225
                text: qsTr("检测到人脸之后还需要将人脸对齐，只有将对齐后的人脸送进网络才能得到更高的精度
一般方法为检测到人脸的特征点之后，通过仿射变换，使之对齐
")
                verticalAlignment: Text.AlignTop
                wrapMode: Text.WrapAnywhere
                elide: Text.ElideNone
                horizontalAlignment: Text.AlignLeft
                font.pixelSize: 26
            }

            Image {
                id: image1
                x: 339
                y: 264
                width: 597
                height: 313
                source: "../images/face2.jpg"
                fillMode: Image.PreserveAspectFit
            }

            Text {

                x: 73
                y: 61
                text: qsTr("人脸对齐
")
                font.pixelSize: 33
            }

        }



        SwipeViewPage {



            Button {
                height: 32
                width: 120
                text: "<-"
                anchors.left: parent.left
                anchors.top: parent.top
                onClicked: stack.pop()
            }

            BorderImage {

                x: 83
                y: 361
                width: 256
                height: 248
                source: "../images/EarthMagCa.png"
            }

            Text {

                x: 73
                y: 130
                width: 990
                height: 225
                text: qsTr("  实现步骤：
将矫正后的人脸输入已训练好神经网络的进行特征提取
经全连接层输出人脸特征值
利用距离判别公式对不同人脸的特征距离进行计算
设定阈值，判断两张人脸是否属于同一个人
PS：常用的距离判别有：欧氏距离，余弦距离
 ")
                verticalAlignment: Text.AlignTop
                wrapMode: Text.WrapAnywhere
                elide: Text.ElideNone
                horizontalAlignment: Text.AlignLeft
                font.pixelSize: 26
            }

            Text {

                x: 73
                y: 61
                text: qsTr("人脸对比")
                font.pixelSize: 33
            }

        }

//        SwipeViewPage {



//            Button {
//                height: 32
//                width: 120
//                text: "<-"
//                anchors.left: parent.left
//                anchors.top: parent.top
//                onClicked: stack.pop()
//            }

//            BorderImage {

//                x: 83
//                y: 361
//                width: 256
//                height: 248
//                source: "../images/corner.png"
//            }

//            Text {

//                x: 73
//                y: 130
//                width: 990
//                height: 225
//                text: qsTr("    大多数情况下，磁力计模块通常安装在智能手机、飞机或汽车等移动物体上，不可避免会倾斜放置，导致磁力计的3轴矢量发生角度变化，这使得确定方位角或行进方向变得更加困难，这时候就需要对航向角进行倾角补偿。
//    倾角补偿方法是需要借助其他传感器设备获取磁力计模块的X轴的倾角(横滚角φ)和Y轴的倾角(俯仰角θ)，如下图4所示，并采用以下公式3进行倾角补偿得到正确的航向角(ψ)
//")
//                verticalAlignment: Text.AlignTop
//                wrapMode: Text.WrapAnywhere
//                elide: Text.ElideNone
//                horizontalAlignment: Text.AlignLeft
//                font.pixelSize: 26
//            }

//            Text {

//                x: 73
//                y: 61
//                text: qsTr("倾角补偿")
//                font.pixelSize: 33
//            }

//            Text {

//                x: 432
//                y: 361
//                width: 522
//                height: 248
//                text: qsTr("    公式3（带倾角补偿的航向角计算公式）

//    X = Hxb*cos(θ) + Hyb*sin(φ) *sin(θ) - Hz *cos(φ)*sin(θ)
//    Y = Hyb*cos(φ) + Hzb*sin(φ)
//    航向角 ψ = atan2(Y,X)

//    θ:俯仰角, φ:翻滚角,ψ:航向角（0º指向正北,90º为正东）")
//                verticalAlignment: Text.AlignTop
//                wrapMode: Text.WrapAnywhere
//                elide: Text.ElideNone
//                horizontalAlignment: Text.AlignLeft
//                font.pixelSize: 26
//            }
//        }


    }

    PageIndicator {
        y: 639
        anchors.horizontalCenterOffset: 0
        anchors.bottomMargin: 81
        count: svMachineLearnContainer.count
        currentIndex: svMachineLearnContainer.currentIndex

        anchors.bottom: svMachineLearnContainer.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }

}
