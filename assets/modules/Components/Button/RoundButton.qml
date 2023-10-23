import QtQuick 2.12
import QtQml 2.12
import QtQuick.Controls 2.12 as Controls
import QtQuick.Layouts 1.15
import Common.Style 1.0
import Common.Components.Text 1.0

Controls.RoundButton {
    id: button

    height: 20
    width:  20

    enum Type{
        Plus,
        Minus
    }
    property int typeCount: 2

    function getType(){
        switch(button.type){
             case 0:
                return "plus"
             case 1:
                return "minus"
            default:
                return "default"
        }
    }

    property int type: Button.Type.Base
    property bool enable: true
    property bool available: true

    font.pixelSize: 16
    icon.source : Style.button.icons.plus
    icon.height: height
    icon.width: width

    Component.onCompleted:{
        state= getType()
    }

    Rectangle{
        id: notAvailableYet
        anchors.fill: parent
        opacity: Style.button.opacity
        radius: Style.button.radius
        visible: false

        Text{
            anchors.centerIn: parent
            text: "Not available \n yet"
        }
    }
    Rectangle{
            anchors.fill: button
            radius: button.radius
            color: button.enabled?Style.button.colors.type.base.enabled:Style.button.colors.type.base.disabled
    }


    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            cursorShape = Qt.PointingHandCursor
            background.opacity = 0.5

            if(!available){
                notAvailableYet.visible = true
            }
        }
        onExited: {
            cursorShape = Qt.ArrowCursor
            background.opacity = 1
            notAvailableYet.visible = false
        }
        onClicked:{ if(enabled){button.clicked()}}
    }

    states: [
        State {
            name: "plus"
            PropertyChanges{
                target: button
                icon.source : Style.button.icons.plus

            }
        },
        State {
            name: "minus"
            PropertyChanges{
                target: button
                icon.source : Style.button.icons.minus
            }
        }
     ]
}