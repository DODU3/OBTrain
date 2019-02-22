import QtQuick 2.0
import QtQuick.Controls 2.2

import RegisterMyType 1.0

Item {
    width: 320
    height: 320

    id : compassui
//    anchors.fill: parent

    property real heading

    function setBearing(headingIn)
    {
        heading = headingIn
        backRotation.angle = -heading
    }

    Item {
        //anchors.centerIn: parent
        anchors.fill: parent
        Image { id: background;
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "compass.svg";

            transform: Rotation {
                id: backRotation
                angle: 0
                origin.x: background.width / 2; origin.y: background.height / 2;
                Behavior on angle {
                    SpringAnimation { spring: 2; damping: 0.2; modulus: 360 }
                }
            }
        }

    }

    Label {
        id: label
        x: 0
        y: 35
        width: 102
        height: 34
        font.pixelSize: 34
        text: qsTr("text")
    }

    Timer {
            //Timer for demo rotation of compass
        interval: 200
        running: true
        repeat: true
        onTriggered: {
            label.text = myclassExposeByRegType.getMagCornerStr();
            setBearing(myclassExposeByRegType.getMagCorner());
        }
    }
}
