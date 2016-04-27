package as3lib.core.string
{
	/**
	 * StringUtil.substitute:使用传入的各个参数替换指定的字符串内的“{n}”标记（参数检索匹配，使用正则表达式）
	 * 虽未经测试但理论上性能低于format
	 */
	public function substitute(str:String, ... rest):String
	{
		if (str == null) return '';
		
		// Replace all of the parameters in the msg string.
		var len:uint = rest.length;
		var args:Array;
		if (len == 1 && rest[0] is Array)
		{
			args = rest[0] as Array;
			len = args.length;
		}
		else
		{
			args = rest;
		}
		
		for (var i:int = 0; i < len; i++)
		{
			str = str.replace(new RegExp("\\{"+i+"\\}", "g"), args[i]);
		}
		
		return str;
	}
}

