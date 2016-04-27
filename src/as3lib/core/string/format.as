package as3lib.core.string
{
	import mx.formatters.DateFormatter;
	/**
	 * 字符串格式化(字符串检索匹配)
	 * </br>实现字符串对格式化参数的支持将{num/num:dateformat}替换成参数值，例：{1}、{2:yyyyMMddHH}
	 * </br>num为有限不小于0且不大于参数个数的值,num值会自动转化成整数并且可以相同，左右允许空格,所有的{num/dateformat}值都必须有对应的参数
	 * </br>参数可以是date类型（会格式化），其他非date类型的值将自动转化成字符串。
	 */
	public function format(str:String, ...params:*):String
	{
		var dateFormatter:DateFormatter;
		str = new String(str) ; 
		var at:Number = -1 ;
		var ch:String = '';
		
		var _error:Function ;
		var _format:Function;
		var _isDigit:Function ;
		var _next:Function;
		var _number:Function;
		var _param:Function;
		var _string:Function;
		var _value:Function;
		var _white:Function ;
		
		//抛出异常
		_error = function(m:String):void { 
			throw new Error(m + '(char ' + at + ')');
		} ;
		//格式化字符串
		_format = function ():String { 
			var s:String = '' ; 
			if (ch == ':') {
				_next();
				while (ch) {
					if (ch == '}'){
						break;
					}
					if (ch == '\\') {
						_next();
					}
					s += ch;
					_next();
				}
				if (!ch) {
					_error("格式化参数意外结束！");
				}
			}
			return s;
		}
		//是否为数字
		_isDigit = function( /*Char*/ c:String ):* { 
			return( ("0" <= c) && (c <= "9") );
		} ;
		//下一个字符
		_next = function():String { 
			at += 1;
			ch = str.charAt(at);
			return ch;
		} ;
		//获取数字
		_number = function ():Number { 
			var n:* = '' ; //数字字符串
			var v:* ; //最终的数字值
			var sign:String = '' ; //正负符号
			
			if (ch == '-') {
				n = '-';
				sign = n ;
				_next();
			}
			
			while ( _isDigit(ch) ) {
				n += ch;
				_next();
			}
			if (ch == '.') {
				n += '.';
				while (_next() && ch >= '0' && ch <= '9') {
					n += ch;
				}
			}
			v = 1 * n ;
			if (!isFinite(v)) {
				_error("格式化参数数字不正确！");
			} else {
				return v;
			}
			return NaN ;
		};
		//参数格式化处理
		_param = function():String { 
			_next();
			_white();
			var paramIndex:int = _number();
			if (isNaN(paramIndex)) {
				_error("格式化参数数字不正确！");
			}
			
			_white();
			var paramFormat:String = _format();
			_next();
			if (paramIndex < 0 || paramIndex >= params.length) {
				_error("格式化参数超出范围！");
			}
			var paramObj:* = params[paramIndex];
			if (paramObj == null) {
				return "";
			}
			else if (paramObj is Date) {
				if(dateFormatter == null){
					dateFormatter = new DateFormatter();
				}
				dateFormatter.formatString = paramFormat;
				return dateFormatter.format(paramObj);
			}
			else {
				return paramObj.toString();
			}
		};
		//提取普通字符串
		_string = function ():String {
			var s:String = '' ; 
			while (ch) {
				if (ch == '{'){
					break;
				}
				if (ch == '\\') {
					_next();
				}
				s += ch;
				_next();
			}
			return s;
		}
		//去除空白字符
		_white = function ():void { 
			while (ch) {
				if (ch <= ' ') {
					_next();
				} else {
					break;
				}
			}
		};
		//获取最终格式化后的字符
		_value = function():String { 
			var s:String = '';
			_next();
			
			while (ch) {
				switch(ch) {
					case '{':
						s += _param();
						break;
					default:
						s += _string();
						break;
				}
			}
			return s;
		};
		return _value();
	}
}

