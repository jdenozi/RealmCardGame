import QtQuick 2.15
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import Qt.labs.platform 1.0
import Components.Card 1.0
import View 1.0
import View.Manager 1.0
import Components.Lottie 1.0

ApplicationWindow {
    id: window
    width: 1800
    height: 900
    visible: true
    signal resize()
    title: qsTr("Realm trading card game " + appVersion)

    WindowResizing {
        id: windowResizing
    }

    Content{
        id: content
    }

    function toggleMaximized() {
        resize()
        if (window.visibility === Window.Maximized) {
            window.showNormal()
        } else {
            window.showMaximized()
        }
    }
}
