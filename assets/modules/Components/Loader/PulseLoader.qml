import QtQuick 2.7
import Common.Style 1.0

Item {

    id: root
    property alias bar_count: repeater.model
    property color color: Style.loader.colors.background
    property int spacing: 5
    property bool running: true

    onRunningChanged: {
        if (bar_count !== repeater.count || timer._bar_index <= bar_count - 1) {
            return;
        }

        for (var bar_index = 0; bar_index < bar_count; bar_index++) {
            if (running) {
                if (repeater.itemAt(bar_index)) {
                    repeater.itemAt(bar_index).playAnimation();
                }
            }
            else {
                if (repeater.itemAt(bar_index)) {
                    repeater.itemAt(bar_index).pauseAnimation();
                }
            }
        }
    }

    Repeater {
        id: repeater
        delegate: Component {
            Rectangle {
                width: (root.width / root.bar_count) - root.spacing
                height: root.height
                x: index * width + root.spacing * index
                transform: Scale {
                    id: scale
                    origin {
                        x: width / 2
                        y: height / 2
                    }
                }
                transformOrigin: Item.Center
                color: root.color

                SequentialAnimation {
                    id: anim
                    loops: Animation.Infinite

                    NumberAnimation { target: scale; property: "yScale"; from: 1; to: 1.5; duration: 300 }
                    NumberAnimation { target: scale; property: "yScale"; from: 1.5; to: 1; duration: 300 }
                    PauseAnimation { duration: root.bar_count * 150 }
                }

                function playAnimation() {
                    if (anim.running == false) {
                        anim.running = true;
                    }

                    if (anim.paused) {
                        anim.paused = false;
                    }
                }

                function pauseAnimation() {
                    if (anim.running) {
                        anim.paused = true;
                    }
                }
            }
        }
    }

    Timer {
        property int _bar_index: 0

        id: timer
        interval: 80
        repeat: true
        onTriggered: {
            if (_bar_index === root.bar_count) {
                stop();
            }
            else {
                repeater.itemAt(_bar_index).playAnimation();
                if (root.running === false) {
                    repeater.itemAt(_bar_index).pauseAnimation();
                }

                _bar_index++;
            }
        }
        Component.onCompleted: start()
    }
}