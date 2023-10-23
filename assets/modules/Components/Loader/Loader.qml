import QtQuick 2.0
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.15
import QtQuick.Layouts 1.15
import Common.Style 1.0
import Common.Components.Text 1.0

Item{
    id: loader
    anchors.fill: parent
    anchors.rightMargin : (parent.width / 2) / 2
    anchors.leftMargin : (parent.width / 2) / 2
    anchors.topMargin: (parent.height / 2) / 2
    anchors.bottomMargin: (parent.height / 2) / 2

    property var title
    property var text

    Item{
        anchors.centerIn: parent
        width: 500
        height: 300

        ColumnLayout{
            anchors.fill: parent
            Item{
                Layout.fillHeight: true
                Layout.fillWidth: true
                PulseLoader { id: pulse_loader; anchors.centerIn: parent; width: bar_count * 50; height: 50; bar_count: 5; spacing: 5;  color: Style.loader.colors.border;}
            }

            Rectangle{
                color: Style.loader.colors.background
                Layout.fillWidth: true
                Layout.fillHeight: true

                Rectangle{
                    color: Style.loader.colors.border
                    anchors.top : parent.top
                    width: parent.width
                    height: 10
                }
                ColumnLayout{
                    anchors.fill: parent

                    Text{
                        text: loader.title
                        color: "white"
                        Layout.alignment: Qt.AlignHCenter
                        Layout.topMargin : 30
                        font.bold: true
                        font.pixelSize: 20
                    }

                    Text{
                        text: loader.text
                        color: "white"
                        Layout.alignment: Qt.AlignHCenter
                    }

                    Rectangle {
                        color: "transparent"
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }
                }
            }

        }

    }

}