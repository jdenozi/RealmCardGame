import QtQuick 2.0

QtObject {
    property color black
    property color white
    property Variant gray
    property Variant red
    property Variant green
    property Variant blue
    property Variant yellow
    property Variant purple
    property Variant beige


    function withAlpha(color: color, alpha: float) {
        if (!color) {
            return "white"
        }
        return Qt.rgba(color.r, color.g, color.b, alpha)
    }
}