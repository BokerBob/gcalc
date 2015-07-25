using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Time as Time;

class RoundMenuData{
    var items;
    var selectedGroup;
    var selectedItem;

    function initialize(items_, selectedGroup_, selectedItem_){
        items = items_;
        selectedGroup = selectedGroup_;
        selectedItem = selectedItem_;
    }

    function getSelectedGroup(){
        return items[selectedGroup];
    }

    function getSelectedItem(){
        return items[selectedGroup][selectedItem];
    }

    function goPrevItem(){
        selectedItem = prevIndex(getSelectedGroup(), selectedItem);
    }
    function goNextItem(){
        selectedItem = nextIndex(getSelectedGroup(), selectedItem);
    }
    function goPrevGroup(){
        selectedGroup = prevIndex(items, selectedGroup);
        selectedItem = 0;
    }
    function goNextGroup(){
        selectedGroup = prevIndex(items, selectedGroup);
        selectedItem = 0;
    }

    function nextIndex(arr, current){
        current = current + 1;
        return arr.size() > current ? current : 0;
    }

    function prevIndex(arr, current){
        current = current - 1;
        return current >= 0 ? current : arr.size() - 1;
    }

    hidden function checkErrors(){
        return !(items instanceof Toybox.Lang.Array) ||
                selectedGroup >= items.size() ||
                !(items[selectedGroup] instanceof Toybox.Lang.Array) ||
                selectedItem >= items[selectedGroup].size();
    }
}

class RoundMenuItem{
    var title;
    var callback;
    function initialize(title_, callback_){
        title = title_;
        callback = callback_;
    }
}

class Point {
    var x;
    var y;
    function initialize(x_, y_){
        x = x_;
        y = y_;
    }
}