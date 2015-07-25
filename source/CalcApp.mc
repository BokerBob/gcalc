using Toybox.Application as App;
using Toybox.WatchUi as Ui;

class CalcApp extends App.AppBase {
    var calcDataFactory;

    function onStart() {
        calcDataFactory = new CalcDataFactory();
    }

    function onStop() {
    }

    function getInitialView() {
        var data = calcDataFactory.getData();
        return [ new CalcView(data), new CalcDelegate(data) ];
    }
}