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
                roundMenuData.getSelectedItem().callback.invoke(calcData.roundMenuData.getSelectedItem().token);
                Ui.requestUpdate();
                return true;
            }
            return false;
        }
        return false;
    }

    function onLongPress(e){
        if(!RoundMenuDelegate.onLongPress(e)){
            if(e.getKey() == Ui.KEY_ENTER){
                calcData.result = calcData.calcEngine.calculate().format("%.3f");
                Ui.requestUpdate();
                return true;
            }
            return false;
        }
        return false;
    }
}