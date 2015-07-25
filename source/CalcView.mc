using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;

class CalcView extends RoundMenuView {
    var calcData;
    const RESULT_COLOR = Gfx.COLOR_DK_GRAY;
    const RESULT_FONT = Gfx.FONT_NUMBER_MEDIUM;

    function initialize(calcData_) {
        roundMenuData = calcData_.roundMenuData;
        calcData = calcData_;
    }

    function onUpdate(dc) {
        RoundMenuView.onUpdate(dc);

        var result = calcData.calcEngine.calculate().toString();
        var cx = dc.getWidth()/2;
        var cy = dc.getHeight()/2;
        dc.setColor(RESULT_COLOR, BG_COLOR);
        dc.drawText(cx, cy, RESULT_FONT, result, Gfx.TEXT_JUSTIFY_CENTER);
    }
}