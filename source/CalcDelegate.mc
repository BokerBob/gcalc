using Toybox.System as Sys;
using Toybox.WatchUi as Ui;

class CalcDelegate extends RoundMenuDelegate {
    var calcData;

    function initialize(calcData_){
        roundMenuData = calcData_.roundMenuData;
        calcData = calcData_;
    }

    function onShortPress(e){
        if(!RoundMenuDelegate.onShortPress(e)){
            if(e.getKey() == Ui.KEY_ENTER){
                roundMenuData.getSelectedItem().callback.invoke();
                return true;
            }
            return false;
        }
        return true;
    }
}