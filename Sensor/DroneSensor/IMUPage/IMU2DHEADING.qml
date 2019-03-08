import QtQuick 2.9
import QtQuick.Controls 2.2

Item {
    id: imu2dheadingpage

    width: 400
    height: 400

//    function setimuBearing(headingIn)
//    {
//        imu2dimage.angle = headingIn
//    }

    Image {
        id: plane2d

        x: 40
        y: 0
        width: 320
        height: 320

        source: "../../../Component/plane2d.png"

        transform: Rotation {
            id: imuRotation
            angle: 0
            origin.x: plane2d.width / 2; origin.y: plane2d.height / 2;
//                Behavior on angle {
//                    SpringAnimation { spring: 2; damping: 0.2; modulus: 360 }
////                    SpringAnimation { spring: 2; damping: 0.2; modulus: 360 }
//                }
        }
    }

    Timer{
        interval: 100
        repeat: true
        triggeredOnStart: false
        running: true

        onTriggered: {
//            imu2dimage.x = 175 + myclassExposeByRegType.getOffsetX();
//            imu2dimage.y = 175 + myclassExposeByRegType.getOffsetY();
            imuRotation.angle = myclassExposeByRegType.getAngleYawNum();
            yawtext.text = myclassExposeByRegType.getAngleYaw();
            //            console.log(myclassExposeByRegType.getOffsetX(), myclassExposeByRegType.getOffsetY());
        }
    }

    Text {
        id: element
        x: 86
        y: 342
        text: qsTr("偏航角：")
        font.pixelSize: 30
    }

    Text {
        id: yawtext
        x: 212
        y: 342
        text: qsTr("0°")
        font.pixelSize: 30
    }

}
