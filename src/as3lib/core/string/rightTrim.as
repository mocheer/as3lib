package as3lib.core.string
{
	import as3lib.core.valid.isWhitespace;

	/**
	 * 删除右部任何空白字符，包括空格、制表符、换页符、,换行等等 [\f\n\r\t\v]
	 * @param
	 * @return
	 */
	public function rightTrim(str:String):String
	{
		if (str == null) return '';
		
		var endIndex:int = str.length - 1;
		while (isWhitespace(str.charAt(endIndex)))
			--endIndex;
		
		if(endIndex>0)
			return str.slice(0, endIndex + 1);
		else
			return "";
	}
}