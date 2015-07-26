using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Time as Time;
using Toybox.Timer as Timer;

class RoundMenuDelegate extends Ui.InputDelegate {
    hidden const LONG_PRESS_DURATION = 300;

    hidden var roundMenuData;
    hidden var lastEvent;
    hidden var timer = new Timer.Timer();

    function initialize(roundMenuData_){
        roundMenuData = roundMenuData_;
    }

    function onKeyPressed(e){
        lastEvent = e;
        timer.start(method(:onLongPressCallback), LONG_PRESS_DURATION, false);
    }

    function onKeyReleased(e){
        if(lastEvent != null && lastEvent.getKey() == e.getKey()){
            lastEvent = null;
            timer.stop();
            onShortPress(e);
        }
    }

    function onLongPressCallback(){
        if(lastEvent == null){
            return false;
        }
        var e = lastEvent;
        lastEvent = null;
        onLongPress(e);
        return true;
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