import QtQuick 2.0

QtObject {
    property var enabled
    property var disabled

    function select(is_enabled: boolean) {
        return is_enabled ? enabled : disabled
    }
}