import QtQuick 2.0
import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import Qt.labs.platform 1.0
import QtQuick.Layouts 1.12
import QtQml 2.12
import QtGraphicalEffects 1.0

Item {
    id:displayScene
    anchors.fill: parent
    //Bottom edge resizing
    MouseArea {
        z:100
        anchors.left: parent.left
        anchors.leftMargin: window.size_area_resize_cursor
        anchors.right: parent.right
        anchors.rightMargin: window.size_area_resize_cursor
        anchors.bottom: parent.bottom
        hoverEnabled: true
        enabled: window.visibility === Window.AutomaticVisibility || window.visibility === Window.Windowed
        height: window.size_area_resize_cursor
        cursorShape: containsMouse? Qt.SizeVerCursor :Qt.ArrowCursor
        onPressed: window.startSystemResize(Qt.BottomEdge)
    }
    //Right edge resizing
    MouseArea {
        z:100
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: window.size_area_resize_cursor
        anchors.right: parent.right
        hoverEnabled: true
        enabled: window.visibility === Window.AutomaticVisibility || window.visibility === Window.Windowed
        width: window.size_area_resize_cursor
        cursorShape: containsMouse? Qt.SizeHorCursor :Qt.ArrowCursor
        onPressed: window.startSystemResize(Qt.RightEdge)
    }
    //Left edge resizing
    MouseArea {
        z:100
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: window.size_area_resize_cursor
        anchors.left: parent.left
        hoverEnabled: true
        enabled: window.visibility === Window.AutomaticVisibility || window.visibility === Window.Windowed
        width: window.size_area_resize_cursor
        cursorShape: containsMouse? Qt.SizeHorCursor :Qt.ArrowCursor
        onPressed: window.startSystemResize(Qt.LeftEdge)
    }
    //Bottom left corner resizing
    MouseArea {
        z:100
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        hoverEnabled: true
        enabled: window.visibility === Window.AutomaticVisibility || window.visibility === Window.Windowed
        width: window.size_area_resize_cursor
        height: width
        cursorShape: containsMouse? Qt.SizeBDiagCursor :Qt.ArrowCursor
        onPressed: window.startSystemResize(Qt.LeftEdge | Qt.BottomEdge)
    }
    //Bottom right corner resizing
    MouseArea {
        z:100
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        hoverEnabled: true
        enabled: window.visibility === Window.AutomaticVisibility || window.visibility === Window.Windowed
        width: window.size_area_resize_cursor
        height: width
        cursorShape: containsMouse? Qt.SizeFDiagCursor :Qt.ArrowCursor
        onPressed: window.startSystemResize(Qt.RightEdge | Qt.BottomEdge)
    }
}
