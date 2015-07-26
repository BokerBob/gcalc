using Toybox.System as Sys;

class CalcData {
    var roundMenuData;
    var calcEngine;
    var tokens;
    var result = "";

    function initialize(roundMenuData_, calcEngine_, tokens_){
        roundMenuData = roundMenuData_;
        calcEngine = calcEngine_;
        tokens = tokens_;
    }

    function getExpression(){
        var exp = "";
        var token = tokens.firstNode;
        while(token != null){
            exp = exp + token.data.value;
            token = token.next;
        }
        return exp;
    }
}

class CalcDataItem extends RoundMenuItem{
    var token;

    function initialize(title_, callback_, token_){
        title = title_;
        callback = callback_;
        token = token_;
    }
}

class Token {
    var id;
    var type;
    var value;
    var isLeftAssociative;
    var precedence;

    function initialize(id_, type_, value_, isLeftAssociative_, precedence_){
        id = id_;
        value = value_;
        type = type_;
        isLeftAssociative = isLeftAssociative_;
        precedence = precedence_;
    }

    function getValue(){
        return value.toFloat();
    }
}