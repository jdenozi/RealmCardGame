import QtQuick 2.12
import QtQml 2.12
import QtQuick.Controls 2.12 as Controls
import QtQuick.Layouts 1.15
import Common.Style 1.0
import Components.Text 1.0

Controls.Button {
    id: button

    enum Type {
        Base
    }

    property int typeCount: 6
    property int type: Button.Type.Base
    property bool enabled: true
    property bool available: true
    property alias border: background.border
    property alias buttonMouseArea: buttonMouseArea
    property int iconMargin: 20

    function getType() {
        switch (button.type) {
        case 0:
            return "base";
        default:
            return "default";
        }
    }

    font.pixelSize: Style.button.textSize
    width: 0
    Component.onCompleted: {
        if (width == 0)
            imageIcon.width + buttonText.text.width < 150 ? 150 : imageIcon.width + buttonText.width + 60;
    }

    Rectangle {
        id: notAvailableYet

        anchors.fill: parent
        opacity: Style.button.opacity
        radius: Style.button.radius
        visible: false

        Text {
            anchors.centerIn: parent
            text: "Not available \n yet"
        }

    }

    contentItem: RowLayout {
        Image {
            id: imageIcon
            fillMode: Image.PreserveAspectFit
            source: button.icon.source
            sourceSize.width: button.height - iconMargin
            sourceSize.height: button.height - iconMargin
            visible: button.icon.source !== ""
            opacity: button.pressed ? 0.3 : 1
            Layout.fillWidth: button.icon.source === ""
            Layout.fillHeight: button.icon.source === ""
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }
        Item {
            id: labelTextWrapper

            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            Controls.Label {
                id: buttonText

                anchors.centerIn: parent
                text: button.text
                wrapMode: Text.Wrap
                font.weight: Font.Bold
                color: "white"
                opacity: button.pressed ? 0.3 : 1
                elide: Text.ElideRight
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                leftPadding: 4
                rightPadding: 4
                topPadding: 4
                bottomPadding: 4
                width: labelTextWrapper.width - leftPadding - rightPadding
                maximumLineCount: 2
            }

        }

    }

    background: Rectangle {
        id: background

        implicitWidth: 100
        implicitHeight: 50
        opacity: button.pressed ? 0.3 : 1
        radius: 4
        state: getType()
        states: [
            State {
                name: "base"

                PropertyChanges {
                    target: background
                    color: button.enabled ? Style.button.colors.type.base.enabled : Style.button.colors.type.base.disabled
                }

                PropertyChanges {
                    target: imageIcon
                    source: Style.button.icons.minus
                }

            }
        ]

        MouseArea {
            id:buttonMouseArea
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                cursorShape = Qt.PointingHandCursor;
                background.opacity = 0.5;
                if (!available)
                    notAvailableYet.visible = true;

            }
            onExited: {
                cursorShape = Qt.ArrowCursor;
                background.opacity = 1;
                notAvailableYet.visible = false;
            }
            onClicked: {
                if (button.enabled)
                    button.clicked();

            }
        }

    }

}