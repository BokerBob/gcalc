using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Time as Time;

class RoundMenuDataFactory{
    function getData(){
        var items = [];
        return new RoundMenuData(items, 0, 0);
    }
}