using Toybox.System as Sys;
using Toybox.Math as Math;

class CalcEngine {
    function initialize(){
    }

    hidden function toRPN(input){
        var operatorStack = new Stack(100);
        var output = new Queue();
        var length = input.length();
        var lastNumberToken = null;
        for(var i = 0; i < length; i++){
            var token = input[i];
            // check for overflow
            var numberToken = checkNumber(token, lastNumberToken);
            if(numberToken != null){
                lastNumberToken = numberToken;
                continue;
            } else {
                if (lastNumberToken != null) {
                    output.enqueue(lastNumberToken);
                    lastNumberToken = null;
                }
                if(checkForFunc(token, operatorStack)){
                }
                else if(checkForOperator(token, operatorStack, output)){
                }
            }
        }
        var topOperator = operatorStack.pop();
        while(topOperator != null){
            output.enqueue(topOperator);
            topOperator = operatorStack.pop();
        }
        return output;
    }

    function checkNumber(token, lastNumberToken){
        if(token.type == :digit){
            if(lastNumberToken != null){
                lastNumberToken.value = lastNumberToken.value + token.value;
            } else {
                lastNumberToken = new Token(:number, :number, token.value);
            }
            return lastNumberToken;
        } else if(token.type == :sign){
            if(lastNumberToken != null){
                //throw error - invalid position of sign
            } else {
                lastNumberToken = new Token(:number, :number, token.value);
            }
            return lastNumberToken;
        } else if(token.type == :dot){
            if(lastNumberToken == null || lastNumberToken.value.find(token.value) != null){
                //throw error - invalid position of dot
            } else {
                lastNumberToken.value = lastNumberToken.value + token.value;
            }
            return lastNumberToken;
        }
        return null;
    }

    function checkFunc(token, operatorStack){
        if(token.type == :func){
            if(funcToken != null){
                operatorStack.push(funcToken);
                return true;
            }
        }
        return false;
    }

    function checkForOperator(token, operatorStack, output){
        if(token.type == :operator){
            var topOperator = operatorStack.pop();
            while(topOperator != null && (
                token.isLeftAssociative && token.precedence <= topOperator.precedence ||
                !token.isLeftAssociative && token.precedence < topOperator.precedence)){
                output.enqueue(topOperator);
                topOperator = operatorStack.pop();
            }
            operatorStack.push(token);
            return true;
        }
        return false;
    }

    function calculate(){
        return 11.246;
    }
}