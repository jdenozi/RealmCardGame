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
    id: libraryPage
    name: "Library"
    headerFactor: 2
    footerFactor: 0
    leftFactor: 4
    rightFactor: 6
    background: Rectangle{
        color: "green"
        anchors.fill: parent
    }


    header: Item {
        Layout.fillHeight: true
        Layout.fillWidth: true
    }

    leftColumn: Item {
        Layout.fillHeight: true
        Layout.fillWidth: true
    }

    content: Item {
        Layout.fillHeight: true
        Layout.fillWidth: true
    }

}