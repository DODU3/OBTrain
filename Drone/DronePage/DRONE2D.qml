import QtQuick 2.9
import QtQuick.Controls 2.2

Item {
    id: imu2dpage

    width: 400
    height: 400

//    function setimuBearing(headingIn)
//    {
//        imu2dimage.angle = headingIn
//    }

    Image {
        id: imu2dimage

        x: 175
        y: 175
        width: 50
        height: 50

        source: "../../../Component/qipao.png"

        transform: Rotation {
            id: imuRotation
            angle: 0
            origin.x: imu2dimage.width / 2; origin.y: imu2dimage.height / 2;
//                Behavior on angle {
//                    SpringAnimation { spring: 2; damping: 0.2; modulus: 360 }
////                    SpringAnimation { spring: 2; damping: 0.2; modulus: 360 }
//                }
        }
    }

    Image {
        id: imubackground

        x: 40
        y: 40
        width: 320
        height: 320
        source: "../../../Component/timg.png"
    }

    Text {
        id: element2
        x: 204
        y: 365
        text: qsTr("俯仰角：")
        font.pixelSize: 30
    }

    Text {
        id: rolltext
        x: 325
        y: 366
        text: qsTr("0°")
        font.pixelSize: 30
    }

    Text {
        id: element
        x: 8
        y: 365
        text: qsTr("横滚角：")
        font.pixelSize: 30
    }

    Text {
        id: pitchtext
        x: 129
        y: 366
        text: qsTr("0°")
        font.pixelSize: 30
    }

    Timer{
        interval: 200
        repeat: true
        triggeredOnStart: false
        running: true

        onTriggered: {
//            imu2dimage.x = 175 + myclassExposeByRegType.getOffsetX();
//            imu2dimage.y = 175 + myclassExposeByRegType.getOffsetY();
//            pitchtext.text = myclassExposeByRegType.getAnglePitch();
//            rolltext.text = myclassExposeByRegType.getAngleRoll();
            if(myclassExposeByRegType.getCurrentPage() === 7)
            {
                //使用三轴加速计得到水平两轴的倾角
                imu2dimage.x = 175 - myclassExposeByRegType.getOffsetX_Acc();
                imu2dimage.y = 175 + myclassExposeByRegType.getOffsetY_Acc();
                pitchtext.text = myclassExposeByRegType.getAccAngleX();
                rolltext.text = -myclassExposeByRegType.getAccAngleY();
            }

        }
    }

}
