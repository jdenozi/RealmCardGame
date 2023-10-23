import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Components.Button 1.0
import QtGraphicalEffects 1.15
import Style 1.0

Rectangle{

    color: Style.colors.gray.dark
    opacity: Style.menu.opacity
    border.color: Style.menu.colors.border
    border.width: Style.menu.border
    radius: Style.menu.radius

    RowLayout{
        anchors.fill: parent

        Image {
            id: img
            source: 'qrc:/images/profile/racoon-profile.jpeg'
            Layout.preferredHeight: parent.height
            Layout.preferredWidth: parent.height
            fillMode: Image.Stretch
            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: mask
            }
        }

        Rectangle {
            id: mask
            width: 500
            height: 500
            radius: 250
            visible: false
        }



    }
}