import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtQml 2.12
import QtGraphicalEffects 1.0
import QtQuick 2.0
import Components 1.0
import Style 1.0
import View.Manager 1.0

View{
    id: loginPage
    headerFactor: 0
    footerFactor: 0.6
    leftFactor: 4
    rightFactor: 0
    backgroundColor: Style.colors.gray.darker

    headerPage: Rectangle {
    }

    leftColumn: Rectangle {
        Layout.fillHeight: true
        Layout.fillWidth: true
        color: Style.colors.gray.base
    }

    content: Rectangle {
        Layout.fillHeight: true
        Layout.fillWidth: true
    }

}