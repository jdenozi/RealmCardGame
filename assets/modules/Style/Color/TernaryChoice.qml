import QtQuick 2.0

QtObject {
    property var enabled
    property var disabled
    property var highlighted

    function select(is_enabled: boolean, is_highlighted: boolean) {
        return is_highlighted ? highlighted : (is_enabled ? enabled : disabled)
    }
}