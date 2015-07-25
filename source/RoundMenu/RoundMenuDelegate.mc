using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Time as Time;

class RoundMenuDelegate extends Ui.InputDelegate {
    hidden const PRESS_DELAY = 1;

    hidden var roundMenuData;
    hidden var pressedKey;
    hidden var pressKeyStart;

    function initialize(roundMenuData_){
        roundMenuData = roundMenuData_;
    }

    function onKeyPressed(e){
        pressedKey = e.getKey();
        pressKeyStart = Time.now();
    }

    function onKeyReleased(e){
        var now = Time.now();
        if(e.getKey() == pressedKey){
            if(pressKeyStart != null && pressKeyStart.subtract(now).value() >= PRESS_DELAY){
                onLongPress(e);
            } else {
                onShortPress(e);
            }
        }
        pressedKey = null;
        pressKeyStart = null;
    }

    function onShortPress(e){
        var key = e.getKey();
        if(key == Ui.KEY_UP){
            roundMenuData.goPrevItem();
            Ui.requestUpdate();
            return true;
        } else if(key == Ui.KEY_DOWN){
            roundMenuData.goNextItem();
            Ui.requestUpdate();
            return true;
        }
        return false;
    }

    function onLongPress(e){
        var key = e.getKey();
        if(key == Ui.KEY_UP){
            roundMenuData.goPrevGroup();
            Ui.requestUpdate();
            return true;
        } else if(key == Ui.KEY_DOWN){
            roundMenuData.goNextGroup();
            Ui.requestUpdate();
            return true;
        }
        return false;
    }
}