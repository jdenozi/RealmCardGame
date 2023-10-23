import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick 2.15
import Style 1.0
import Components.Text 1.0
import View.Manager 1.0

ColumnLayout {
    Layout.preferredHeight: parent.height
    Layout.preferredWidth: parent.width
    Layout.leftMargin: 10

    ListModel {
        id: elementModel
        ListElement { text: qsTr("Play")}
        ListElement { text: qsTr("Deck")}
        ListElement { text: qsTr("Shop")}
        ListElement { text: qsTr("Library")}
        ListElement { text: qsTr("Settings")}
        ListElement { text: qsTr("Aide")}
        ListElement { text: qsTr("Settings")}
    }

    Repeater {
        model: elementModel
        delegate: Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: Style.colors.gray.dark
            opacity: Style.menu.opacity
            border.color: Style.menu.colors.border
            border.width: Style.menu.border
            radius: Style.menu.radius

            ScrollingText {
                text: modelData
                Layout.preferredWidth: parent.width / 2
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                scroll_offset: 1
                color: Style.colors.white
                font.pixelSize: Style.menu.textSize
                font.bold: true
            }

            MouseArea {
                id: mouseArea
                anchors.fill: parent

                Behavior on height {
                    NumberAnimation {
                        duration: 300
                        easing.type: Easing.InOutQuad
                    }
                }

                onEntered: {
                    parent.height += 10;
                }

                onExited: {
                    parent.height -= 10;
                }

                onClicked: {
                    ViewState.goBattle()
                }
            }
        }
    }

    Item{
        Layout.preferredHeight: parent.height / 5
        Layout.fillWidth: true
    }
}
