import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    width: 300
    height: 450
    radius: 10
    border.color: "#191c29"
    border.width: 14



    Rectangle {
        id: cardImage
        width: parent.width - 24
        height: parent.height * 0.55
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        // source: "https://via.placeholder.com/200x110"
        // fillMode: Image.PreserveAspectFit
    }

    Rectangle {
        id: cardDetails
        width: parent.width - 24
        height: parent.height * 0.25
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: cardImage.bottom
        color: "#debca7"
        radius: 30
        border.color: "#bd4129"
        border.width: 3

        Text {
            id: cardTitle
            text: "Card Title"
            anchors.centerIn: parent
            font.pixelSize: 18
            font.family: "SF Mono Regular"
            color: "black"
        }

        Text {
            id: cardDescription
            text: "This is the card description. It can be a bit longer to test text wrapping."
            width: parent.width - 20
            height: parent.height - cardTitle.height
            anchors.centerIn: parent
            font.pixelSize: 14
            font.family: "SF Mono Regular"
            color: "black"
            wrapMode: Text.WordWrap
        }
    }

    Rectangle {
        id: cardFooter
        width: parent.width - 24
        height: parent.height * 0.1
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        color: "#debca7"
        radius: 3
        border.color: "#bd4129"
        border.width: 3

        Text {
            id: authorText
            text: "Author: John Doe"
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 12
            font.family: "SF Mono Regular"
            color: "black"
            padding: 5
        }

        Text {
            id: copyrightText
            text: "© 2023 Trading Card Inc."
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 10
            font.family: "SF Mono Regular"
            color: "black"
            padding: 5
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
        }
    }
}
