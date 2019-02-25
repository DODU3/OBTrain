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
            id: swipeViewPage



            Button {
                height: 32
                width: 120
                text: "<-"
                anchors.left: parent.left
                anchors.top: parent.top
                onClicked: stack.pop()
            }

            BorderImage {

                x: 497
                y: 348
                width: 329
                height: 248
                anchors.horizontalCenterOffset: 15
                anchors.horizontalCenter: parent.horizontalCenter
                source: "../images/AlphaGo.jpg"
            }

            Text {

                x: 73
                y: 130
                width: 898
                height: 259
                text: qsTr("    人工智能是计算机科学的一个分支，它企图了解智能的实质，并生产出一种新的能以人类智能相似的方式做出反应的智能机器.
    2016年3月15日，谷歌人工智能AlphaGo与围棋世界冠军李世石的人机大战最后一场落下了帷幕。人机大战第五场经过长达5个小时搏杀，最终李世石与AlphaGo总比分定格在1比4，以李世石认输结束。以此为契机，全球范围内掀起了一场人工智能（AI）的热潮。
")
                verticalAlignment: Text.AlignTop
                wrapMode: Text.WordWrap
                elide: Text.ElideNone
                horizontalAlignment: Text.AlignLeft
                font.pixelSize: 26
            }

            Text {

                x: 73
                y: 61
                text: qsTr("AI简介")
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
                source: "../images/AI_ML.jpg"
            }
            BorderImage {
                x: 400
                y: 361
                width: 640
                height: 248
                source: "../images/ML_Human.jpg"
            }

            Text {
                x: 73
                y: 130
                width: 990
                height: 225
                text: qsTr("    机器学习(Machine Learning, ML)专门研究计算机怎样模拟或实现人类的学习行为。它是人工智能的核心，是使计算机具有智能的根本途径。
    本质：统计学
    方法：
        对现有的数据（特征）进行分析（训练），进而获得规律（模型），然后进行判断和预测。当前机器学习的主要应用场景：计算机视觉。")
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
                text: qsTr("机器学习")
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
                text: qsTr("    传统机器学习
        拥有严谨的数学论证
        计算开销较小
    深度学习
        缺乏直接的数学证明
        计算开销大
        效果普遍好于传统机器学习
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
                text: qsTr("机器学习")
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

                x: 450
                y: 130
                width: 740
                height: 400
                source: "../images/feature_hand.jpg"
            }

            Text {

                x: 73
                y: 130
                width: 990
                height: 225
                text: qsTr("    特征的构造：
        基本上为人工构造特征
        人工特征的优缺点：
            针对某些场景高度优化
            泛化能力（普适性）较差
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
                text: qsTr("传统机器学习与CV")
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


            Text {

                x: 73
                y: 130
                width: 990
                height: 225
                text: qsTr("    常见的传统机器学习算法：
        线性回归（LR）
        支持向量机（SVM）
    优缺点
    LR：
        优点：模型简单（如：y = ax + b），计算简单
        缺点：需要大量数据才会有较好效果
    SVM：
        优点：适合数据量较少的场景
        缺点：模型复杂（多元、无固定解），计算复杂
    样例：KCF视觉跟踪算法
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
                text: qsTr("传统机器学习与CV")
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

                x: 497
                y: 348
                width: 329
                height: 248
                anchors.horizontalCenterOffset: 15
                anchors.horizontalCenter: parent.horizontalCenter
                source: "../images/framework.jpg"
            }

            Text {

                x: 73
                y: 130
                width: 898
                height: 259
                text: qsTr("    深度学习的概念源于人工神经网络的研究。深度学习通过组合低层特征形成更加抽象的高层表示属性类别或特征，以发现数据的分布式特征表示。
    CNN（卷积神经网络）：包含卷积、池化等计算且具有深度结构的前馈神经网络（Feedforward Neural Networks），是深度学习（deep learning）的代表算法之一。
")
                verticalAlignment: Text.AlignTop
                wrapMode: Text.WordWrap
                elide: Text.ElideNone
                horizontalAlignment: Text.AlignLeft
                font.pixelSize: 26
            }

            Text {

                x: 73
                y: 61
                text: qsTr("深度学习与CV")
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

                x: 497
                y: 348
                width: 329
                height: 248
                anchors.horizontalCenterOffset: 15
                anchors.horizontalCenter: parent.horizontalCenter
                source: "../images/detection_tracking.gif"
            }

            Text {

                x: 73
                y: 130
                width: 898
                height: 259
                text: qsTr("    在计算机视觉领域，CNN目前主要用于：
        物体识别
            样例：使用CNN进行姿态识别
        物体检测
            样例：使用CNN进行人体检测")
                verticalAlignment: Text.AlignTop
                wrapMode: Text.WordWrap
                elide: Text.ElideNone
                horizontalAlignment: Text.AlignLeft
                font.pixelSize: 26
            }

            Text {

                x: 73
                y: 61
                text: qsTr("深度学习与CV")
                font.pixelSize: 33
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
