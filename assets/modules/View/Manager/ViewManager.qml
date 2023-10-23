import QtQuick 2.0
import QtQuick.Layouts 1.15
import QtQml.Models 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12

StackLayout {
    id: stack
    anchors.fill: parent
    currentIndex: 0

    function changePage(name) {
        for (var i = 0; i < stack.children.length; i++) {
            if (name == stack.children[i].objectName) {
                stack.currentIndex = i
                stack.children[stack.currentIndex].resize()
            }
        }
    }
}
