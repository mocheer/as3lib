package as3lib.core.convert
{
	/**
	 * JSON 反序列化
	 * @param source  数据源JSON字符串,可解析boolean,number（包括16进制数）,string,null
	 *	1、	当开头（去除空白字符）为"'，其结尾不是"'时返回undefined；
	 *	2、	当开头是数字，后面有非数字时返回遇到非数字之前的数字，
	 *	3、	当开头（去除空白字符）为[{ 中间任何解析失败都会报错。
	 *	4、	除了上面的几种情况，当字符串非true，false，null时都会报错，包括空白字符串。
	 *  update 解析科学计数法
	 */
	public function toJson(source:String):* 
	{
		source = new String(source) ; // null，true，false 都会返回字符串格式
		var at:Number = 0 ;
		var ch:String = ' ';
		
		var _isDigit:Function ;
		var _isHexDigit:Function ;
		var _white:Function ;
		var _string:Function ;
		var _next:Function ;
		var _array:Function ;
		var _object:Function ;
		var _number:Function ;
		var _word:Function ;
		var _value:Function ;
		var _error:Function ;
		
		//数字字符
		_isDigit = function(  c:String ):* {
			return( ("0" <= c) && (c <= "9") );
		} ;
		//16进制字符
		_isHexDigit = function( c:String ):* {
			return( _isDigit( c ) || (("A" <= c) && (c <= "F")) || (("a" <= c) && (c <= "f")) );
		} ;
		
		_error = function(m:String):void {
			throw new Error(m, at-1);
		} ;
		//下个字符
		_next = function():* {
			ch = source.charAt(at);
			at += 1;
			return ch;
		} ;
		
		_white = function ():void {
			while (ch) {
				if (ch <= ' ') {
					_next();
				} else if (ch == '/') {
					switch (_next()) {
						case '/':
							while (_next() && ch != '\n' && ch != '\r') {}
							break;
						case '*':
							_next();
							for (;;) {
								if (ch) {
									if (ch == '*') {
										if (_next() == '/') {
											_next();
											break;
										}
									} else {
										_next();
									}
								} else {
									_error("Unterminated Comment");
								}
							}
							break;
						default:
							_error("Syntax Error at char " + at.toString());
					}
				} else {
					break;
				}
			}
		};
		
		_string = function ():* {
			
			var i:* = '' ;
			var s:* = '' ; 
			var t:* ;
			var u:* ;
			var outer:Boolean = false;
			//trg 20100910 增加字符串对单引号甚至无引号的支持，降低对json字符串解析的规范要求。
			var qchar:String = '"';
			if (ch == "'" || ch == '"') {
				qchar = ch;
				_next();
			}
			else {
				qchar = "";
			}
			
			while (true) {
				if (qchar.length==0 && (ch==':' || ch <= ' ')){
					return s;
				}
				else if (ch == qchar) {
					_next();
					return s;
				}
				else if (ch == '\\') 
				{
					switch (_next()) {
						case 'b':
							s += '\b';
							break;
						case 'f':
							s += '\f';
							break;
						case 'n':
							s += '\n';
							break;
						case 'r':
							s += '\r';
							break;
						case 't':
							s += '\t';
							break;
						case 'u':
							u = 0;
							for (i = 0; i < 4; i += 1) {
								t = parseInt(_next(), 16);
								if (!isFinite(t)) {
									outer = true;
									break;
								}
								u = u * 16 + t;
							}
							if(outer) {
								outer = false;
								break;
							}
							s += String.fromCharCode(u);
							break;
						default:
							s += ch;
					}
				} else {
					s += ch;
				}
				if (!_next()) {
					break;
				}
			}
		} ;
		
		_array = function():* {
			var a:Array = [];
			if (ch == '[') {
				_next();
				_white();
				if (ch == ']') {
					_next();
					return a;
				}
				while (ch) {
					a.push(_value());
					_white();
					if (ch == ']') {
						_next();
						return a;
					} else if (ch != ',') {
						break;
					}
					_next();
					_white();
				}
			}
			_error("Bad Array");
			return null ;
		};
		
		_object = function ():* {
			var k:* = {} ;
			var o:* = {} ;
			if (ch == '{') {
				
				_next();
				
				_white();
				
				if (ch == '}') 
				{
					_next() ;
					return o ;
				}
				
				while (ch) 
				{
					k = _string();
					_white();
					if (ch != ':') 
					{
						break;
					}
					_next();
					o[k] = _value();
					_white();
					if (ch == '}') {
						_next();
						return o;
					} else if (ch != ',') {
						break;
					}
					_next();
					_white();
				}
			}
			_error("Bad Object") ;
		};
		
		_number = function ():* {
			
			var n:* = '' ;
			var v:* ;
			var hex:String = '' ;
			var sign:String = '' ;
			
			if (ch == '-') {
				n = '-';
				sign = n ;
				_next();
			}
			
			if( ch == "0" ) {
				_next() ;
				if( ( ch == "x") || ( ch == "X") ) {
					_next();
					while( _isHexDigit( ch ) ) {
						hex += ch ;
						_next();
					}
					if( hex == "" ) {   
						_error("mal formed Hexadecimal") ;
					} else {
						return Number( sign + "0x" + hex ) ;
					}
				} else {
					n += "0" ;
				}
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
			//科学计数法
			if(ch == 'e' || ch == 'E')
			{
				n += ch;
				_next();
				if(ch == "+" || ch== "-")
				{
					n += ch;
				}
				while (_next() && ch >= '0' && ch <= '9') {
					n += ch;
				}
			}
			v = 1 * n ;
			if (!isFinite(v)) {
				_error("Bad Number");
			} else {
				return v;
			}
			return NaN ;
		};
		//判断是否为true，false，null
		_word = function ():* {
			switch (ch) {
				case 't':
					if (_next() == 'r' && _next() == 'u' && _next() == 'e') {
						_next();
						return true;
					}
					break;
				case 'f':
					if (_next() == 'a' && _next() == 'l' && _next() == 's' && _next() == 'e') {
						_next();
						return false;
					}
					break;
				case 'n':
					if (_next() == 'u' && _next() == 'l' && _next() == 'l') {
						_next();
						return null;
					}
					break;
			}
			_error("Syntax Error at char " + at.toString());
			return null ;
		};
		
		_value = function ():* {
			_white();
			switch (ch) {
				case '{':
					return _object();
				case '[':
					return _array();
				case "'":
				case '"':
					return _string();
				case '-':
					return _number();
				default:
					return ch >= '0' && ch <= '9' ? _number() : _word();
			}
		};
		
		return _value() ;
	}
}
