using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;

class CalcView extends RoundMenuView {
    var calcData;
    const EXP_COLOR = Gfx.COLOR_WHITE;
    const EXP_FONT = Gfx.FONT_TINY;
    const RES_COLOR = Gfx.COLOR_RED;
    const RES_FONT = Gfx.FONT_NUMBER_MEDIUM;

    function initialize(calcData_) {
        roundMenuData = calcData_.roundMenuData;
        calcData = calcData_;
    }

    function onUpdate(dc) {
        RoundMenuView.onUpdate(dc);

        var expression = calcData.getExpression();
        var result = calcData.result; //calcData.calcEngine.calculate().toString();

        var cx = dc.getWidth()/2;
        var cy = dc.getHeight()/2;
        var dy = -50;

        dc.setColor(EXP_COLOR, BG_COLOR);
        dc.drawText(cx, cy + dy, EXP_FONT, expression, Gfx.TEXT_JUSTIFY_CENTER);

        dc.setColor(RES_COLOR, BG_COLOR);
        dc.drawText(cx, cy, RES_FONT, result, Gfx.TEXT_JUSTIFY_CENTER);
    }
}