package com.yo.framework.utils
{
	import flash.external.ExternalInterface;

	/**
	 * 表达式计算
	 * @author Dalton
	 * Shunting-yard algorithm
     * 
	 */
	public class OperatorUtil
	{
		//是否是一元运算符
		private static function isOperatorOneTarget(ch:String):Boolean
		{
			return ch == "!" || ch == "sin"|| ch == "cos"|| ch == "tan"|| ch == "cot"|| ch == "log" || ch == "sqrt" || ch == "round" || ch == "ceil" || ch == "floor";
		}
		
		private static function isNumber(exp:String,i:int):Boolean
		{
			if (i >= exp.length || i < 0)
				return false;
			
			var op:String = exp.charAt(i);
			return op >= "0" && op <= "9" || op == ".";
		}
        
        /**
         * 是否是合法变量名 
         * @param exp
         * @param i
         * @return 
         * 
         */        
        private static function isVar(exp:String,i:int):Boolean {
            if (i >= exp.length || i < 0)
                return false;
            
            var op:String = exp.charAt(i);
            var reg:RegExp = new RegExp(/^[a-zA-Z0-9_][a-zA-Z_]*/);
            return op.search(reg) != -1;
        }
		
        /**
         * 获取操作符关键字 
         * @param exp
         * @param i
         * @return 
         * 
         */        
		private static function getOperator(exp:String,i:int):String 
		{ 
			var mustOneTarget:Boolean = (i == 0 || !isNumber(exp,i - 1) && exp.charAt(i - 1) != ")");//当没有前一个数字，必须是一元运算符
            mustOneTarget = false;
			var op:String;
			if (i + 4 < exp.length)
			{
				op = exp.slice(i, i + 5);
				if (op == "round" || 
                    op == "floor")
					return op;
			}
			if (i + 3 < exp.length)
			{
				op = exp.slice(i, i + 4);
				if (op == "sqrt" || 
                    op == "ceil")
					return op;
			}
			if (i + 2 < exp.length)
			{
				op = exp.slice(i, i + 3);
				if (op == "sin" || 
                    op == "cos" || 
                    op == "tan" || 
                    op == "cot" || 
                    op == "log" || 
                    op == "pow" || 
                    op == "max" || 
                    op == "min"){
					//避免maxHp这种
					if(exp.charAt(i + 3) == "("){
						return op;
					}
				}
			}
			if (i + 1 < exp.length)
			{
				op = exp.slice(i, i + 2);
				if (op == "<<" || 
                    op == ">>" || 
                    op == ">=" || 
                    op == "<=" || 
					op == "==" || 
                    op == "!=" || 
                    op == "&&" || 
                    op == "||")
					return op;
			}
			if (i < exp.length)
			{
				op = exp.charAt(i);
				if (op == "+" || 
                    op == "-" || 
                    op == "*" || 
                    op == "/" || 
                    op == "%" ||
					op == ">" || 
                    op == "<" || 
                    op == "=" || 
                    op == "&" || 
                    op == "^" || 
                    op == "|" || 
                    op == "!")
					return op;
			}
			return null;
		}
		
		private static function getPriority(op:String):int 
		{ 
			switch(op)
			{ 
				case ")": 
					return uint.MAX_VALUE;
				case "round":
				case "floor":
				case "ceil":
				case "sqrt":
				case "sin":
				case "cos":
				case "tan":
				case "cot":
				case "log":
					return 13;
				case "pow":
				case "max":
				case "min":
					return 12;
				case "!":
					return 11;
				case "*": 
				case "/":
				case "%":
					return 10; 
				case "+": 
				case "-":
					return 9; 
				case "<<":
				case ">>":
					return 8;
				case ">":
				case "<":
				case ">=":
				case "<=":
					return 7;
				case "=":
				case "==":
				case "!=":
					return 6;
				case "&":
					return 5;
				case "^":
					return 4;
				case "|":
					return 3;
				case "&&":
					return 2;
				case "||":
					return 1;
				case "(": 
					return -1; 
				default: 
					return 0;
			} 
		}
		
		private static function getValue(op:String, operand1:Number, operand2:Number):Number
		{ 
			switch (op) 
			{ 
				case "!":
					return operand1 ? 0 : 1;
				case "round":
					return Math.round(operand1);
				case "floor":
					return Math.floor(operand1);
				case "ceil":
					return Math.ceil(operand1);
				case "sqrt":
					return Math.sqrt(operand1);
				case "log":
					return Math.log(operand1);
				case "sin":
					return Math.sin(operand1 * Math.PI / 180);
				case "cos":
					return Math.cos(operand1 * Math.PI / 180);
				case "tan":
					return Math.tan(operand1 * Math.PI / 180);
				case "cot":
					return 1 / Math.tan(operand1 * Math.PI / 180);
				case "pow":
					return Math.pow(operand2,operand1);
				case "max":
					return Math.max(operand1,operand2);
				case "min":
					return Math.min(operand1,operand2);
				case "*": 
					return operand2 * operand1; 
				case "/": 
					return operand2 / operand1;
				case "%":
					return operand2 % operand1;
				case "-": 
					return operand2 - operand1; 
				case "+": 
					return operand2 + operand1;
				case "<<":
					return operand2 << operand1;
				case ">>":
					return operand2 >> operand1;
				case ">":
					return operand2 > operand1 ? 1 : 0;
				case "<":
					return operand2 < operand1 ? 1 : 0;
				case ">=":
					return operand2 >= operand1 ? 1 : 0;
				case "<=":
					return operand2 <= operand1 ? 1 : 0;
				case "=":
				case "==":
					return operand2 == operand1 ? 1 : 0;
				case "!=":
					return operand2 != operand1 ? 1 : 0;
				case "&":
					return operand2 & operand1;
				case "^":
					return operand2 ^ operand1;
				case "|":
					return operand2 | operand1;
				case "&&":
					return operand2 && operand1 ? 1 : 0;
				case "||":
					return operand2 || operand1 ? 1 : 0;
			}
			return NaN;
		}
		
		private static function execOperator(operators:Array,operands:Array):void
		{
			var op:String = operators.pop(); 
			var operand1:Number = operands.pop();
			var operand2:Number;
			if (! isOperatorOneTarget(op)){
				//如果是二元运算符，取两个值
				operand2 = Number(operands.pop());
			}
				 
			operands.push(Number(getValue(op, operand1, operand2).toFixed(7))); 
		}
		
		private static function replaceAll(str:String,oldValue:String,newValue:String):String
		{
			var newStr:String = str;
			do
			{
				str = newStr;
				newStr = str.replace(oldValue,newValue);
			}
			while (newStr != str)
			return newStr;
		}
		
		/**
		 * 计算表达式 
		 * @param exp
		 * @return 
		 * 
		 */
		public static function exec(exp:String,params:Object = null):*
		{ 
			exp = exp.replace(/\s/g,"");
			
			var operators:Array = [];
			var operands:Array = [];
			
			var pos:int=0;
			
			while (pos < exp.length) 
			{ 
				var ch:String = exp.charAt(pos);
				var operator:String = getOperator(exp,pos);
				if (operator) 
				{ 
					//如果优先级顺序由增加变为减少，则计算比它优先级高的数据直到优先级回到这一级
					while (getPriority(operator) <= getPriority(operators[operators.length - 1]) && operators.length){
						execOperator(operators, operands);
					}
					
					operators.push(operator);
					pos += operator.length; 
				}
				else if (ch == "(") 
				{
					operators.push(ch); 
					pos++; 
				}
				else if (ch == ")") 
				{
					//如果遇到)，则计算数据直到遇到一个(
					while (operators[operators.length - 1] != "(" && operators.length){
						execOperator(operators, operands);
					}
					operators.pop(); 
					pos++; 
				}
				else if(ch == ","){
					while (operators[operators.length - 1] != "(" && operators.length){
						execOperator(operators, operands);
					}
					pos++;
				}
				else if (isNumber(exp,pos) || ch == "-")
				{
					var n:String = "";
					do
					{
						n = n + exp.charAt(pos);
						pos++; 
					}while (isNumber(exp,pos) && pos < exp.length)
					operands.push(Number(n));
				} 
                else if (isVar(exp, pos)) {
                    var v:String = "";
                    do
                    {
                        v = v + exp.charAt(pos);
                        pos++; 
                    }while (isVar(exp, pos) && pos < exp.length)
                    
                    if (params[v] != undefined) {
                        operands.push(Number(params[v]));
                    }
                }
				else
				{
					return NaN;
				}
			}
			
			while (operators.length) 
				execOperator(operators,operands);
            
            var ret:Number = operands.pop();
			if (isNaN(ret)) {
                throw new ArgumentError('公式计算异常:' + exp); 
            }
			return ret; 
		}
        
        public static function test():void {
//            trace('测试变量名', exec("a+abc+1+c", {'a': 1, 'abc': 2}));
//            trace('测试正弦', exec("sin(a-29)", {'a': 29}) == 0);
//            trace('测试二元', exec("power(a, 2)", {'a': 2}) == 4);
//            trace('测试优先级', exec("1 + 1 * (2 / 1)") == 3);
//            trace('测试异常', exec("power a, (2", {'a': 2}));
//			trace(exec("max(1-(1-0.1), 0.05)", {ItemLv:5}));
//			trace(exec("ceil(max((ItemLv+1)*MaxHP*0.02,1))", {ItemLv:1, MaxHP:2800}));
//			trace(exec("(ItemLv+1)*(MinDamage+MaxDamage)/2*0.02", {ItemLv:4, MinDamage:361, MaxDamage:372}));
//			trace(exec("pow(1.1,Level)", {Level:1}));
//			trace(exec("(pow(1.1,Level)*50)", {Level:1}));
//			trace(exec("60+(Level-1)*10", {Level:1, AttackBase:154}));
//			trace(exec("pow(Level,1.5)*20+60", {Level:1, AttackBase:154}));
        }
		
		/**
		 * 利用浏览器JS计算表达式 
		 */
		public static function execByJS(exp:String,params:Object = null):*
		{
			if (params)
			{
				for (var p:String in params)
				{
					exp.replace(new RegExp(p,"g"),params[p]);
				}
			}
			return ExternalInterface.available ? ExternalInterface.call("eval",exp) : null
		}		
	}
}
