using Toybox.System as Sys;
using Toybox.WatchUi as Ui;

class CalcDataFactory extends RoundMenuDataFactory {
    var calcEngine;

    function initialize(){
        calcEngine = new CalcEngine();
        fillFakeEngine(calcEngine);
    }

    function test(){
        Sys.println("callback");
    }

    function fillFakeEngine(calcEngine_){
        calcEngine_.root = new Lexeme(new Lexeme(null, null, :number, 3), new Lexeme(null, null, :number, 5), :plus, null);
    }

    function createMenuItem(name, method){
        return new RoundMenuItem(Ui.loadResource(name), method);
    }

    function getData(){
        var items = [[
              createMenuItem(Rez.Strings.menu_one, method(:test)),
              createMenuItem(Rez.Strings.menu_two, method(:test)),
              createMenuItem(Rez.Strings.menu_three, method(:test)),
              createMenuItem(Rez.Strings.menu_four, method(:test)),
              createMenuItem(Rez.Strings.menu_five, method(:test)),
              createMenuItem(Rez.Strings.menu_six, method(:test)),
              createMenuItem(Rez.Strings.menu_seven, method(:test)),
              createMenuItem(Rez.Strings.menu_eight, method(:test)),
              createMenuItem(Rez.Strings.menu_nine, method(:test)),
              createMenuItem(Rez.Strings.menu_zero, method(:test)),
              createMenuItem(Rez.Strings.menu_dot, method(:test)),
              createMenuItem(Rez.Strings.menu_sign, method(:test))
        ],[
              createMenuItem(Rez.Strings.menu_plus, method(:test)),
              createMenuItem(Rez.Strings.menu_minus, method(:test)),
              createMenuItem(Rez.Strings.menu_multiple, method(:test)),
              createMenuItem(Rez.Strings.menu_divide, method(:test)),
              createMenuItem(Rez.Strings.menu_sqrt, method(:test))
              //createMenuItem(Rez.Strings.menu_percentage, method(:test)),
              //createMenuItem(Rez.Strings.menu_divideByOne, method(:test))
              //createMenuItem("MC", method(:test)),
              //createMenuItem("MR", method(:test)),
              //createMenuItem("MS", method(:test)),
              //createMenuItem("M+", method(:test)),
              //new RoundMenuItem("M-", method(:test))
        ]];
        var roundMenuData = new RoundMenuData(items, 0, 0);
        var calcData = new CalcData(roundMenuData, calcEngine);
        return calcData;
    }
}