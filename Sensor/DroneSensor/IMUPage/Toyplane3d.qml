import QtQuick 2.9
import QtQuick.Window 2.2

import QtQuick 2.2 as QQ2
import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Input 2.0
import Qt3D.Extras 2.0

import "../../../Component"

Entity {
    id: sceneRoot

    function setRoll(drollAngle){
        toyplaneTransform.rollAngle = -drollAngle;
    }

    function setPitch(dpitchAngle){
        toyplaneTransform.pitchAngle = -dpitchAngle;
    }

    function setYaw(dyawAngle){
        toyplaneTransform.angle = -dyawAngle - 90;
    }


    Camera {
        id: camera
        projectionType: CameraLens.PerspectiveProjection
        fieldOfView: 45
        aspectRatio: 1
        nearPlane : 0.1
        farPlane : 1000.0
        position: Qt.vector3d( 0.0, 0.0, -40.0 )
        upVector: Qt.vector3d( 0.0, 1.0, 0.0 )
        viewCenter: Qt.vector3d( 0.0, 0.0, 0.0 )
    }


    components: [
        RenderSettings {
            activeFrameGraph: ForwardRenderer {
                clearColor: Qt.rgba(1, 1, 1, 1)
                camera: camera
            }
        },
        // Event Source will be set by the Qt3DQuickWindow
        InputSettings { }
    ]

    PhongMaterial {
        id: material
    }


    Mesh {
        id: toyplaneMesh
        source: "../../../Component/toyplane.obj"
    }

    Transform {
        id: toyplaneTransform

        property real rollAngle: 0
        property real pitchAngle: 15
        property real angle: -90

        matrix: {
            var m = Qt.matrix4x4();
            m.rotate(angle, Qt.vector3d(0, 1, 0));
            m.rotate(pitchAngle, Qt.vector3d(0, 0, 1));
            m.rotate(rollAngle, Qt.vector3d(1, 0, 0));
            m.scale(0.8);
            return m;
        }
    }

    Entity {
        id: planeEntity
        components: [ toyplaneMesh, material, toyplaneTransform ]
    }

}

