import QtQuick 2.0

Item {
    id : compassui
    anchors.fill: parent

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
}
