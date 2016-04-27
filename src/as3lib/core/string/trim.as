package as3lib.core.string
{
	import as3lib.core.valid.isWhitespace;

	/**
	 * StringUtil.trim:删除首尾空白字符，包括空格、制表符、换页符、,换行等等 [\f\n\r\t\v]
	 */
	public function trim(str:String):String 
	{
		if (str == null) return '';
		
		var startIndex:int = 0;
		while (isWhitespace(str.charAt(startIndex)))
			++startIndex;
		
		var endIndex:int = str.length - 1;
		while (isWhitespace(str.charAt(endIndex)))
			--endIndex;
		
		if (endIndex >= startIndex)
			return str.slice(startIndex, endIndex + 1);
		else
			return "";
	}
}
