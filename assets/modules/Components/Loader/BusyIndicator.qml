import QtQuick 2.12
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.12
import Common.Style 1.0

Rectangle {
    id: busyIndicator

    property alias gradientColor: colorStop1.color
    property alias backgroundColor: rect_center.color

    function start() {
        rota_anim.start();
    }

    function stop() {
        rota_anim.stop();
    }

    color: "transparent"
    height: 20
    width: 20
    visible: false
    onVisibleChanged: {
        if (visible)
            busyIndicator.start();
        else
            busyIndicator.stop();
    }

    //Rotation animation uses to rotate the busy indicator
    RotationAnimator {
        id: rota_anim

        target: busyIndicator
        running: false
        from: 0
        to: 360
        loops: Animation.Infinite
        duration: 1250
    }

    //Create a conical gradient
    ConicalGradient {
        id: gradient_busy

        anchors.fill: parent
        angle: 0
        visible: false

        gradient: Gradient {
            GradientStop {
                id:colorStop1
                position: 1
                color: Style.colors.blue.dark
            }

            GradientStop {
                id: colorStop2
                position: 0.4
                color: colorStop1.color
            }

            GradientStop {
                position: 0
                color: "transparent"
            }

        }

    }

    //We create a mask to cut borders of the ConicalGradient
    OpacityMask {
        anchors.fill: gradient_busy
        source: gradient_busy
        maskSource: mask_top_circle

        //This rect is used to hide the center of the conical Gradient
        Rectangle {
            id: rect_center

            anchors.centerIn: parent
            width: parent.width * 0.64
            height: parent.height * 0.64
            color: Style.colors.gray.dark
            radius: height / 2
        }

    }

    //Rect mask used by the opacity mask
    Rectangle {
        id: mask_top_circle

        color: "red"
        anchors.fill: parent
        radius: height / 2
        visible: false
    }

}
