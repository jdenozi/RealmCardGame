import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Style 1.0

Text {
    id: text
    property int speed: 50 // Pixels per seconds
    property bool scroll_on_hover: true
    property int scroll_delay_in: 2000 // Milliseconds
    property int scroll_delay_out: 2000 // Milliseconds
    property int scroll_offset: 0
    property bool running: false
    state: "default"
    property TextMetrics metrics: text_metrics
    property TextMetrics metrics_elided: text_metrics_elided

    horizontalAlignment: Text.AlignLeft
    verticalAlignment: Text.AlignVCenter
    elide: Text.ElideRight
    clip: true
    font.family: Style.text.font

    states: [
        State {
            name: "default"
        },
        State {
            name: "hovered"
            PropertyChanges { target: text; running: true }
        }
    ]

    onRunningChanged: {
        if (running && truncated) {
            animation.restart()
        } else {
            text.leftPadding = 0
            animation.stop()
        }
    }

    SequentialAnimation on leftPadding {
        id: animation
        loops: Animation.Infinite
        running: text.running && text.truncated
        
        property int scroll: text.contentWidth - text_metrics.advanceWidth - anchors.leftMargin - anchors.rightMargin - scroll_offset
        property int duration: Math.min(Math.max(1000 * Math.abs(animation.scroll) / text.speed, 500), 10000)
        
        PropertyAnimation {
            to: 0
            duration: text.scroll_delay_in
        }
        
        PropertyAnimation {
            to: animation.scroll
            duration: Math.min(Math.max(1000 * Math.abs(animation.scroll) / text.speed, 500), 10000)
        }
       
        PropertyAnimation {
            duration: text.scroll_delay_out
        }
        
        PropertyAnimation {
            to: 0
            duration: 0 
        }
    }

    MouseArea {
        enabled: text.scroll_on_hover
        anchors.fill: parent
        hoverEnabled: true
        propagateComposedEvents: true
        acceptedButtons: Qt.NoButton

        onEntered: {
            text.state = "hovered"
        }

        onExited: {
            text.state = "default"
        }
    }

    Text {
        id:     text_helper
        font:   parent.font
        text:   parent.text
        elide:  parent.elide
        visible: false
    }

    TextMetrics {
        id:     text_metrics
        font:   text_helper.font
        text:   text_helper.text
        elide:  text_helper.elide
        elideWidth: parent.width
    }

    TextMetrics {
        id:     text_metrics_elided
        font:   text_helper.font
        text:   text_metrics.elidedText
        elide:  text_helper.elide
        elideWidth: parent.width
    }
}