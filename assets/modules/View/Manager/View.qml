import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15

Page {
    id: page

    // Properties
    property string name
    property double headerFactor: 1
    property double footerFactor: 1
    property int leftFactor: 1
    property int rightFactor: 1
    property int columns: 1
    property int rows: 1

    // Aliases
    property alias leftColumn: left.data
    property alias rightColumn: right.data

    property int margin: 0

    // Default content property
    default property alias content: grid.children

    // Signals
    signal resized()

    header: Rectangle{
        id: header
    }

    // Footer
    footer: Rectangle {
        id: footer
    }

    // Layout
    Layout.preferredHeight: parent.height
    Layout.preferredWidth: parent.width

    // Row Layout
    RowLayout {
        id: row
        anchors.fill: parent
        anchors.topMargin: margin
        anchors.bottomMargin: margin
        anchors.leftMargin: margin
        anchors.rightMargin: margin
        spacing: 5

        // Left Column
        Item {
            Layout.fillHeight: true
            Layout.preferredWidth: (page.width / 12) * leftFactor
            RowLayout {
                id: left
                anchors.fill: parent
            }
        }

        // Grid
        GridLayout {
            id: grid
            Layout.fillHeight: true
            Layout.fillWidth: true
            columns: page.columns
            rows: page.rows
        }

        // Right Column
        Item {
            Layout.fillHeight: true
            Layout.preferredWidth: (page.width / 12) * rightFactor
            RowLayout {
                id: right
                anchors.fill: parent
            }
        }
    }

    // Function to handle resizing
    function resize() {
        page.Layout.preferredHeight = parent.height
        page.Layout.preferredWidth = parent.width

        var headerSize = (page.height / 12) * headerFactor
        var footerSize = (page.height / 12) * footerFactor
        var leftSize = (width / 12) * leftFactor
        var rightSize = (width / 12) * rightFactor

        left.Layout.preferredWidth = leftSize
        right.Layout.preferredWidth = rightSize

        page.header.height = (headerSize === null) ? 0 : headerSize
        page.footer.height = (footerSize === null) ? 0 : footerSize

        page.resized()
    }

    // Invoke resize function when width or height changes
    onWidthChanged: resize()
    onHeightChanged: resize()

    // Connections to handle window resizing
    Connections {
        target: window
        function onResize() {
            page.resize()
        }
    }

    // Mouse Area for hiding
    MouseArea {
        id: hiddingArea
        anchors.fill: parent
        visible: false
        hoverEnabled: true
        acceptedButtons: Qt.AllButtons
    }

}
