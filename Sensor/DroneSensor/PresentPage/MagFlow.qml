import QtQuick 2.9
import QtQuick.Controls 2.2
import ".."
import "../../../Component"

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
                y: 126
                width: 683
                height: 501
                source: "../images/flow.PNG"
            }

            Text {

                x: 73
                y: 61
                text: qsTr("磁力计模块系统流程图")
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
