import QtQuick 2.0
import View.Home 1.0
import View.Manager 1.0

ViewManager {
    id: pageManager
    anchors.fill: parent

    Home{
        objectName: "home"
    }

}