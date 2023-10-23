import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.4
import QtQuick.Particles 2.0

import Common.Style 1.0

Item {

    Rectangle {
        color: Style.colors.gray.dark
        anchors.fill: parent
    }

    ParticleSystem {
        id: particles
    }

    ImageParticle {
        system: particles
        source: "qrc:img/img/bubble.png"
        alpha: 0.4
        alphaVariation: 0.2
        colorVariation: 1.4
        rotationVariation: 1.2
    }

    Emitter {
        system: particles
        emitRate: 15
        lifeSpan: 70000
        velocity: PointDirection {
            x: -30
            xVariation: -100
        }
        size: 20
        sizeVariation: 50
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 5
    }
}
