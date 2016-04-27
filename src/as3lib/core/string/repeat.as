package as3lib.core.string
{
	/**
	 * StringUtil.repeat:返回一个字符串，该字符串由其自身与指定次数串联的指定字符串构成。
	 */
	public  function repeat(str:String, n:int):String
	{
		if (n == 0)return "";
		var s:String = str;
		for (var i:int = 1; i < n; i++)
		{
			s += str;
		}
		return s;
	}

}

