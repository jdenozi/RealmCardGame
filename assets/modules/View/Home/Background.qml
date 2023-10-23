import QtQuick 2.15
import QtQuick.Controls 2.12

Item {
    width: 800
    height: 600

    ListModel {
        id: imageListModel
        ListElement { source: "qrc:/images/background/golgari.jpg" }
        ListElement { source: "qrc:/images/background/gruul.jpg" }
        ListElement { source: "qrc:/images/background/izzet.jpg" }
        ListElement { source: "qrc:/images/background/selesnya.jpg" }
    }

    Component.onCompleted:{
        timer.start()
    }

    property int currentIndex: 0

    Image {
        id: imageBack
        fillMode: Image.Stretch
        anchors.fill: parent
        opacity: 1
        source: imageListModel.get(1).source
    }

    Image {
        id: imageFront
        fillMode: Image.Stretch
        anchors.fill: parent
        opacity: 1
        source: imageListModel.get(0).source

        OpacityAnimator {
            id: animation
            target: imageFront
            from: 1
            to: 0
            duration: 2000
            running: false
            onFinished: {
                currentIndex = (currentIndex + 1) % imageListModel.count;
                imageFront.source = imageListModel.get((currentIndex)).source
                currentIndex = (currentIndex + 1) % imageListModel.count;
                imageBack.source = imageListModel.get((currentIndex)).source
                imageFront.opacity = 1
                imageBack.opacity = 1
            }
        }
    }

    // A Timer to change the image every 5 seconds
    Timer {
        id: timer
        interval: 10000
        running: true
        repeat: true

        onTriggered: {
            animation.start()
        }
    }
}
