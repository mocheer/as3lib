package as3lib.core.convert
{
	/**
	 * 序列化
	 * @param o  数据源对象  
	 */
	public function toString(o:*):String
	{
		var c:String ; // char
		var i:Number ;
		var l:Number ;
		var s:String = '' ;
		var v:* ;
		switch (typeof o) 
		{
			case 'object' :
				
				if (o)
				{
					if (o is Array) 
					{
						
						l = o.length ;
						
						for (i = 0 ; i < l ; ++i) 
						{
							v = toString(o[i]);
							if (s) s += ',' ;
							s += v ;
						}
						return '[' + s + ']';
						
					}
					else if (typeof(o.toString) != 'undefined') 
					{
						
						for (var prop:String in o) 
						{
							v = o[prop];
							if ( (typeof(v) != 'undefined') && (typeof(v) != 'function') ) 
							{
								v = toString(v);
								if (s) s += ',';
								s += toString(prop) + ':' + v ;
							}
						}
						return "{" + s + "}";
					}
				}
				return 'null';
				
			case 'number':
				
				return isFinite(o) ? String(o) : 'null' ;
				
			case 'string' :
				
				l = o.length ;
				s = '"';
				for (i = 0 ; i < l ; i += 1) {
					c = o.charAt(i);
					if (c >= ' ') {
						if (c == '\\' || c == '"') 
						{
							s += '\\';
						}
						s += c;
					} 
					else 
					{
						switch (c) 
						{
							
							case '\b':
								s += '\\b';
								break;
							case '\f':
								s += '\\f';
								break;
							case '\n':
								s += '\\n';
								break;
							case '\r':
								s += '\\r';
								break;
							case '\t':
								s += '\\t';
								break;
							default:
								var code:Number = c.charCodeAt() ;
								s += '\\u00' + (Math.floor(code / 16).toString(16)) + ((code % 16).toString(16)) ;
						}
					}
				}
				return s + '"';
				
			case 'boolean':
				return String(o);
				
			default:
				return 'null';
		}
	}
}