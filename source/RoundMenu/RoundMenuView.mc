using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Time as Time;

class RoundMenuView extends Ui.View {
    hidden const BG_COLOR = Gfx.COLOR_BLACK;
    hidden const FG_COLOR = Gfx.COLOR_LT_GRAY;
    hidden const HG_COLOR = Gfx.COLOR_ORANGE;
    hidden const LW_COLOR = Gfx.COLOR_LT_GRAY;

    hidden const FG_FONT = Gfx.FONT_SMALL;
    hidden const HG_FONT = Gfx.FONT_SMALL;
    hidden const LW_FONT = Gfx.FONT_SMALL;

    hidden const DR = 20;

    hidden var roundMenuData;

    function initialize(roundMenuData_) {
        roundMenuData = roundMenuData_;
    }

    function onLayout(dc) {
    }

    function onShow() {
    }

    hidden function getRoundCoord(cx, cy, a, r){
        var x = cx + r*Math.sin(a);
        var y = cy - r*Math.cos(a);
        return new Point(x, y);
    }

    hidden function drawLine(dc, cx, cy, a, r){
        var lr1 = r - 3;
        var lr2 = r;
        var l1 = getRoundCoord(cx, cy, a, lr1);
        var l2 = getRoundCoord(cx, cy, a, lr2);
        dc.drawLine(l1.x, l1.y, l2.x, l2.y);
    }

    function onUpdate(dc) {
        //View.onUpdate(dc);
        var cx = dc.getWidth()/2;
        var cy = dc.getHeight()/2;
        var r = cx;

        dc.setColor(FG_COLOR, BG_COLOR);
        dc.clear();
        dc.setPenWidth(3);
        //dc.drawCircle(cx, cy, r);
        var size = roundMenuData.items[roundMenuData.selectedGroup].size();
        var delta = 2*Math.PI/size;
        var tr = r - DR;
        var ty = -dc.getFontHeight(FG_FONT)/2;
        for(var i = 0; i < size; i++){
            var item = roundMenuData.items[roundMenuData.selectedGroup][i];
            var a = delta*i;
            var roundCoord = getRoundCoord(cx, cy, a, tr);
            var x = roundCoord.x;
            var y = roundCoord.y + ty;

            var font = null;
            if(roundMenuData.selectedItem == i){
                dc.setColor(HG_COLOR, BG_COLOR);
                font = HG_FONT;
                drawLine(dc, cx, cy, a, r);
            } else if(i == roundMenuData.prevIndex(roundMenuData.getSelectedGroup(), roundMenuData.selectedItem) ||
                      i == roundMenuData.nextIndex(roundMenuData.getSelectedGroup(), roundMenuData.selectedItem)) {
                dc.setColor(LW_COLOR, BG_COLOR);
                font = LW_FONT;
                //drawLine(dc, cx, cy, a, r);
            } else
            {
                dc.setColor(FG_COLOR, BG_COLOR);
                font = LW_FONT;
                //drawLine(dc, cx, cy, a, r);
            }

            var limitCoord = getRoundCoord(cx, cy, a, r);
            var limit = limitCoord.x;
            var tw = dc.getTextWidthInPixels(item.title, font);
            if(x < cx){
                var tx = x - tw/2;
                if(tx < limit){
                    x = x + limit - tx;
                }
            } else if(x > cx) {
                var tx = x + tw/2;
                if(tx > limit){
                    x = x - tx + limit;
                }
            }

            dc.drawText(x, y, font, item.title, Gfx.TEXT_JUSTIFY_CENTER);
        }
    }
}