using Toybox.System as Sys;
using Toybox.WatchUi as Ui;

class CalcDataFactory extends RoundMenuDataFactory {
    var calcEngine;
    var tokens;
    var calcData;

    function addToken(token){
        tokens.addLast(token);
        calcData.result = "";
    }

    function initialize(){
        calcEngine = new CalcEngine();
        tokens = new DoublyLinkedList();
    }

    function createMenuItem(token){
        return new CalcDataItem(token.value, method(:addToken), token);
    }

    function getData(){
        var items = [[
              createMenuItem(new Token(:one, :digit, "1", null, null)),
              createMenuItem(new Token(:two, :digit, "2", null, null)),
              createMenuItem(new Token(:three, :digit, "3", null, null)),
              createMenuItem(new Token(:four, :digit, "4", null, null)),
              createMenuItem(new Token(:five, :digit, "5", null, null)),
              createMenuItem(new Token(:six, :digit, "6", null, null)),
              createMenuItem(new Token(:seven, :digit, "7", null, null)),
              createMenuItem(new Token(:eight, :digit, "8", null, null)),
              createMenuItem(new Token(:nine, :digit, "9", null, null)),
              createMenuItem(new Token(:zero, :digit, "0", null, null)),
              createMenuItem(new Token(:dot, :dot, ",", null, null))
        ],[
              createMenuItem(new Token(:addition, :operator, "+", true, 3)),
              createMenuItem(new Token(:subtraction, :operator, "-", true, 3)),
              createMenuItem(new Token(:multiplication, :operator, "*", true, 2)),
              createMenuItem(new Token(:division, :operator, "/", true, 2))
        ]];
        var roundMenuData = new RoundMenuData(items, 0, 0);
        calcData = new CalcData(roundMenuData, calcEngine, tokens);
        return calcData;
    }
}