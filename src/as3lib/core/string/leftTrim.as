package as3lib.core.string
{
	import as3lib.core.valid.isWhitespace;

	/**
	 * 删除左部任何空白字符，包括空格、制表符、换页符、,换行等等 [\f\n\r\t\v]
	 * @param
	 * @return
	 */
	public function leftTrim(str:String):String
	{
		if (str == null) return '';
		
		var startIndex:int = 0;
		while (isWhitespace(str.charAt(startIndex)))
			++startIndex;
		if(startIndex == str.length)
			return str.slice(startIndex);
		else
			return "";
		

	}
}