import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.15
import Common.Style 1.0

TextField{
    id: control
    property string unit : ""
    property string textControl : ""
    property bool isSlider : false
    property double maxValue : 100
    property double minValue : 0
    property double firstLim : 0
    property double secondLim : 0
    property double firstStep : 1
    property double secondStep : 1
    property double thirdStep : 1
    property double firstNumberDec : 0
    property double secondNumberDec : 0
    property double thirdNumberDec : 0
    property double nbStepFirst : firstLim-minValue == 0 ? 0 : parseInt((firstLim-minValue)/firstStep)
    property double nbStepSecond : secondLim-firstLim == 0 ? 0 : parseInt((secondLim-firstLim)/secondStep)
    property double nbStepThird : parseInt((maxValue-secondLim)/thirdStep)
    property double nbTotalStep : nbStepFirst + nbStepSecond + nbStepThird
    signal valueTextChanged(var newValue)
    function calculateVariable(position, width){
        var newValue = parseInt((nbTotalStep*position)/width)
        return checkValue(newValue)
    }
    function checkValue(newValue){
        if(newValue <minValue){
            newValue = minValue
        }
        else if(newValue<nbStepFirst){
            newValue = (newValue*firstStep).toFixed(firstNumberDec)
        }
        else if(newValue<(nbStepFirst+nbStepSecond)){
            newValue = ((newValue-nbStepFirst)*secondStep+firstLim).toFixed(secondNumberDec)
        }
        else if(newValue>= (nbStepFirst+nbStepSecond) && newValue <=nbTotalStep){
            newValue = ((newValue-(nbStepFirst+nbStepSecond))*thirdStep + secondLim).toFixed(thirdNumberDec)
        }
        else if(newValue>nbTotalStep){
            newValue = maxValue
        }
        return newValue
    }

    function checkValueManuallyEnter(newValue){
            if(newValue <minValue){
                newValue = minValue
            }
            else if(newValue<firstLim){
                newValue = newValue.toFixed(firstNumberDec)
            }
            else if(newValue<secondLim && newValue >= firstLim){
                newValue = newValue.toFixed(secondNumberDec)
            }
            else if(newValue>= secondLim && newValue <=maxValue){
                newValue = newValue.toFixed(thirdNumberDec)
            }
            else if(newValue>maxValue){
                newValue = maxValue
            }
            return newValue
        }

    background: Rectangle{
        implicitWidth: control.width
        implicitHeight: control.height
        color : Style.colors.gray.dark
        border.color: control.focus ? Style.colors.blue.base : isSlider ? Style.colors.blue.base : Style.colors.gray.base
        border.width: 1
        radius : 4
    }
    text: textControl + unit
    color: Style.colors.white
    font.pixelSize: 14
    validator : DoubleValidator {bottom: minValue; top: maxValue; locale:"C"}
    MouseArea{
        anchors.fill: parent
        onClicked: {
            if(!control.isSlider){
                control.forceActiveFocus()
                control.text = control.text.replace(unit,"")
            }
            control.isSlider = false
        }
        onPositionChanged: {
            if(pressed){
                control.isSlider = true
                control.text = calculateVariable(mouse.x, control.width) + unit
            }
        }
        onReleased: {
            var newValue = control.text.replace(unit,"")
            valueTextChanged(parseFloat(newValue))
        }
    }
    onFocusChanged: {
        if(!focus){
            var newValue = checkValueManuallyEnter(parseFloat(control.text.replace(",",".")))
            valueTextChanged(newValue)
            control.text = newValue + unit

        }
    }
    onAccepted: {control.focus = false}
}