import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Components.Button 1.0
import View.Profile 1.0
import Style 1.0

Item{

    RowLayout{
        anchors.fill: parent
        anchors.margins: parent.height / 5

        Profile{
            id: profil
            Layout.fillHeight: true
            Layout.preferredWidth: parent.width / 4
        }

        Item{
            Layout.fillHeight: true
            Layout.preferredWidth: parent.width / 3
        }

        RowLayout{
            Layout.fillHeight: true
            Layout.preferredWidth: parent.width / 3
            Rectangle{
                Layout.fillHeight: true
                Layout.preferredWidth: parent.width / 4
                color: Style.colors.gray.dark
                opacity: Style.menu.opacity
                border.color: Style.menu.colors.border
                border.width: Style.menu.border
                radius: Style.menu.radius
            }

            Rectangle{
                Layout.fillHeight: true
                Layout.preferredWidth: parent.width / 4
                color: Style.colors.gray.dark
                opacity: Style.menu.opacity
                border.color: Style.menu.colors.border
                border.width: Style.menu.border
                radius: Style.menu.radius
            }

            Rectangle{
                Layout.fillHeight: true
                Layout.preferredWidth: parent.width / 4
                color: Style.colors.gray.dark
                opacity: Style.menu.opacity
                border.color: Style.menu.colors.border
                border.width: Style.menu.border
                radius: Style.menu.radius
            }

        }

    }

}




