pragma Singleton
import QtQuick 2.0

QtObject {
    property AbstractStyle active: DefaultStyle
    property var colors: active != null ? active.colors : null
    property var card: active != null ? active.card : null
    property var button: active != null ? active.button : null
    property var text: active != null ? active.text : null
    property var menu: active != null ? active.menu : null


}