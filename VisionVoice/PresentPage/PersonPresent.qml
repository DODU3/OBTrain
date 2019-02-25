import QtQuick 2.9
import QtQuick.Controls 2.2
import ".."
import "../../Component"

Page {
    width: 1920
    height: 1080

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
                height: 143
                text: qsTr("    人脸识别，是基于人的脸部特征信息进行身份识别的一种生物识别技术。用摄像机或摄像头采集含有人脸的图像或视频流，并自动在图像中检测和跟踪人脸，进而对检测到的人脸进行脸部识别的一系列相关技术，通常也叫做人像识别、面部识别。
         人脸识别可以归纳为以下三个过程：

人脸检测
人脸对齐
人脸对比
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
                text: qsTr("人脸识别")
                font.pixelSize: 33
            }

            Image {
                id: image
                x: 472
                y: 330
                width: 100
                height: 100
                fillMode: Image.PreserveAspectFit
                source: "qrc:/qtquickplugin/images/template_image.png"
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
                text: qsTr("    人脸检测（Face Detection），就是给一幅图像，找出图像中的所有人脸位置，通常用一个矩形框框起来，输入是一幅图像img，输出是若干个包含人脸的矩形框位置(x,y,w,h)，就像这样：
")
                verticalAlignment: Text.AlignTop
                wrapMode: Text.WrapAnywhere
                elide: Text.ElideNone
                horizontalAlignment: Text.AlignLeft
                font.pixelSize: 26
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
                text: qsTr("    事实上，磁力计都被安装在汽车、飞机或其他带金属材料的壳具里。金属效应（比如铁、镍、钢、钴等金属）将会干扰或弯曲地球磁场，这会改变磁力计方向。
    针对磁力计周围金属对地球磁场的干扰，需要采集3轴原始数据做归圆归零校准。
    通常采用8字校准法对周围磁场干扰进行校准，要求用户将磁力计模块在空中做8字立体晃动，采集立体8个象限的原始数据， 如图2 所示。
    校准完成后会得到3轴零偏(offset)以及3轴比例(scale)等6个校准参数，并采用公式1对原始数据进行校准。")
                verticalAlignment: Text.AlignTop
                wrapMode: Text.WrapAnywhere
                elide: Text.ElideNone
                horizontalAlignment: Text.AlignLeft
                font.pixelSize: 26
            }

            Text {

                x: 73
                y: 61
                text: qsTr("磁力计校准")
                font.pixelSize: 33
            }

            Text {
                id: element2
                x: 432
                y: 361
                width: 522
                height: 248
                text: qsTr("    公式1（磁力计校准公式）

    Hxb = (Hx - offset_x) * scale_x
    Hyb = (Hy - offset_y) * scale_y
    Hzb = (Hz - offset_z) * scale_z
")
                verticalAlignment: Text.AlignTop
                wrapMode: Text.WrapAnywhere
                elide: Text.ElideNone
                horizontalAlignment: Text.AlignLeft
                font.pixelSize: 26
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
                text: qsTr("    地磁场是一个矢量，对于一个固定的地点来说，这个矢量可以被分解为两个与当地水平面平行的分量(Hx和Hy)和一个与当地水平面垂直的分量(Hz)。如果保持磁力计和当地的水平面平行，那么磁力计的三个轴就和这三个分量对应起来， 如图3 所示。
    实际上对水平方向的两个分量来说，他们的矢量和总是指向磁北(Hnorth)。磁力计的航向角(ψ)就是当前方向和磁北的夹角。
    所以在水平放置情况下只需要用磁力计水平方向两轴(Hx和Hy)的检测数据带入如下公式2，就可以计算出航向角(ψ) ")
                verticalAlignment: Text.AlignTop
                wrapMode: Text.WrapAnywhere
                elide: Text.ElideNone
                horizontalAlignment: Text.AlignLeft
                font.pixelSize: 26
            }

            Text {

                x: 73
                y: 61
                text: qsTr("水平放置情况下磁力计计算公式")
                font.pixelSize: 33
            }

            Text {

                x: 432
                y: 361
                width: 522
                height: 248
                text: qsTr("    公式2（水平放置下航向角计算公式）

    航向角 ψ = atan2(Hy,Hx)
")
                verticalAlignment: Text.AlignTop
                wrapMode: Text.WrapAnywhere
                elide: Text.ElideNone
                horizontalAlignment: Text.AlignLeft
                font.pixelSize: 26
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
                source: "../images/corner.png"
            }

            Text {

                x: 73
                y: 130
                width: 990
                height: 225
                text: qsTr("    大多数情况下，磁力计模块通常安装在智能手机、飞机或汽车等移动物体上，不可避免会倾斜放置，导致磁力计的3轴矢量发生角度变化，这使得确定方位角或行进方向变得更加困难，这时候就需要对航向角进行倾角补偿。
    倾角补偿方法是需要借助其他传感器设备获取磁力计模块的X轴的倾角(横滚角φ)和Y轴的倾角(俯仰角θ)，如下图4所示，并采用以下公式3进行倾角补偿得到正确的航向角(ψ)
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
                text: qsTr("倾角补偿")
                font.pixelSize: 33
            }

            Text {

                x: 432
                y: 361
                width: 522
                height: 248
                text: qsTr("    公式3（带倾角补偿的航向角计算公式）

    X = Hxb*cos(θ) + Hyb*sin(φ) *sin(θ) - Hz *cos(φ)*sin(θ)
    Y = Hyb*cos(φ) + Hzb*sin(φ)
    航向角 ψ = atan2(Y,X)

    θ:俯仰角, φ:翻滚角,ψ:航向角（0º指向正北,90º为正东）")
                verticalAlignment: Text.AlignTop
                wrapMode: Text.WrapAnywhere
                elide: Text.ElideNone
                horizontalAlignment: Text.AlignLeft
                font.pixelSize: 26
            }
        }


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
