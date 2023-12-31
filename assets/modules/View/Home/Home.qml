import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtQml 2.12
import QtGraphicalEffects 1.0
import QtQuick 2.0
import Style 1.0
import View.Manager 1.0
import Components.Menu 1.0

View{
    id: homePage
    name: "Home"
    headerFactor: 2
    footerFactor: 0
    leftFactor: 4
    rightFactor: 6
    background: Background{anchors.fill: parent}


    header: Header {
        Layout.fillHeight: true
        Layout.fillWidth: true
    }

    leftColumn: Options {
        Layout.fillHeight: true
        Layout.fillWidth: true
    }

    content: Item {
        Layout.fillHeight: true
        Layout.fillWidth: true
    }

}