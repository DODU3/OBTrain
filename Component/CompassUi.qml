import QtQuick 2.0
import QtQuick.Controls 2.2

import RegisterMyType 1.0

Item {
    width: 400
    height: 400

    id : compassui
//    anchors.fill: parent

    property real heading

    function setBearing(headingIn)
    {
        heading = headingIn
        backRotation.angle = -heading
    }

    Item {
        id: element
        //anchors.centerIn: parent
        anchors.fill: parent
        Image { id: background;
            anchors.leftMargin: 55
        anchors.topMargin: 38
            anchors.rightMargin: 55
            anchors.bottomMargin: 68
            //            anchors.leftMargin: 0
//        anchors.topMargin: 48
//            anchors.rightMargin: 0
//        anchors.bottomMargin: 88
        anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "compass.svg";

            transform: Rotation {
                id: backRotation
                angle: 0
                origin.x: background.width / 2; origin.y: background.height / 2;
//                Behavior on angle {
//                    SpringAnimation { spring: 2; damping: 0.2; modulus: 360 }
////                    SpringAnimation { spring: 2; damping: 0.2; modulus: 360 }
//                }
            }
        }

    }

    Image {
        id: arrow
        x: 169
        y: 0
        width: 52
        height: 39
        source: "arrow.png"
    }

    Label {
        id: label
        x: 74
        y: 342
        width: 253
        height: 57
        font.pixelSize: 55
        text: qsTr("text")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.bold: true
        font.family: "Times New Roman"
    }

    Timer {
        //Timer for demo rotation of compass
        interval: 100
        running: true
        repeat: true
        onTriggered: {
            label.text = myclassExposeByRegType.getMagCornerStr();
            setBearing(myclassExposeByRegType.getMagCorner());
        }
    }
}
