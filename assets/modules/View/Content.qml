import QtQuick 2.0
import View.Home 1.0
import View.Manager 1.0
import View.Help 1.0
import View.Battle 1.0
import View.Library 1.0

ViewManager {
    id: pageManager
    anchors.fill: parent

    Home{
        objectName: "home"
    }

    Battle{
        objectName: "battle"
    }

    Library{
        objectName: "library"
    }

    Help{
        objectName: "help"
    }

    Connections{
        target: ViewState

        function onGoHome(){
            changePage("home")
        }

        function onGoHelp(){
            changePage("help")
        }

        function onGoLibrary(){
            changePage("library")
        }

        function onGoBattle(){
            changePage("battle")
        }
    }
}