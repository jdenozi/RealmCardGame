import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Style 1.0
import Components.Lottie 1.0

Rectangle {

    property var name: ""
    property var description: ""
    property var attack: ""
    property var defense: ""
    property var manaCost: ""
    property int selectedColor: Card.CardType.Vision


    enum CardType {
        Spell,
        Vision,
        Invocation,
        Ritual,
        Extractor,
        Equipment
    }

    width: 300
    height: 450
    radius: Style.card.radius
    border.color: Style.card.colors.border
    border.width: Style.card.border

    color: selectedColor === Card.CardType.Vision ? Style.card.type.vision:
                selectedColor === Card.CardType.Invocation ? Style.card.type.invocation :
                selectedColor === Card.CardType.Ritual ? Style.card.type.ritual :
                selectedColor === Card.CardType.Extractor ? Style.card.type.extractor :
                selectedColor === Card.CardType.Equipment ? Style.card.type.equipment : "white"

    ColumnLayout{
        anchors.fill: parent
        anchors.margins: parent.border.width + 10
        spacing: 2

        Rectangle{
            color: Style.card.content.background
            border.width: Style.card.content.border
            radius: Style.card.content.radius
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.1

            RowLayout{
                anchors.fill: parent
                anchors.margins: 5
                Item{
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }
                Rectangle {
                    Layout.preferredHeight: parent.height * 0.8
                    Layout.preferredWidth: height * 0.8
                    radius: width / 2
                    color: Style.colors.gray.light
                    border.color: Style.card.colors.border
                    border.width: 2
                }
            }
        }

        Rectangle {
            color: "blue"
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.5
            radius: Style.card.radius

            Image {
                anchors.fill: parent
                source: "qrc:images/cards/img/014-rohk-metal-bird-god.jpeg"
                fillMode: Image.Stretch
            }
        }

        Rectangle{
            color: Style.card.content.background
            border.width: Style.card.content.border
            radius: Style.card.content.radius
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.05
        }

        Rectangle{
            color: Style.card.content.background
            border.width: Style.card.content.border
            radius: Style.card.content.radius
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

    }

    Item{
        anchors.fill: parent
        anchors.margins: parent.border.width
        Image {
            anchors.fill: parent
            source: "qrc:images/cards/old-overlay.jpg"
            fillMode: Image.Stretch
            opacity :0.2
        }
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
        }
    }

    LottieAnimation {
        id: fancyAnimation
        property double factor: 0.6
        height: parent.height + parent.height * factor
        width: parent.width + parent.width * factor
        x: (-parent.width * factor) / 2
        y: (-parent.height * factor) / 2

        source: Qt.resolvedUrl(Style.card.animation.focus)
        loops: Animation.Infinite
        fillMode: Image.Stretch
        running: true
    }
}
