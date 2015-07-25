using Toybox.System as Sys;
using Toybox.Math as Math;

class CalcEngine {
    var root;

    function initialize(){
        root = new Lexeme();
    }

    function calculate(){
        return root.calculate();
    }
}

class Lexeme {
    var left;
    var right;
    var type;
    var value;

    function initialize(left_, right_, type_, value_){
        left = left_;
        right = right_;
        type = type_;
        value = value_;
    }

    function calculate(){
        if(type == :number){
            return value;
        }
        if(type == :plus){
            return left.calculate() + right.calculate();
        }
        if(type == :minus){
            return left.calculate() - right.calculate();
        }
        if(type == :multiple){
            return left.calculate() * right.calculate();
        }
        if(type == :divide){
            return left.calculate() + right.calculate();
        }
        if(type == :sqrt){
            return Math.sqrt(left.calculate());
        }
        return null;
    }
}