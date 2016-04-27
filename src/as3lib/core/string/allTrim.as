package as3lib.core.string
{
	/**
	 * 删除所有空白字符，包括空格、制表符、换页符、,换行等等 [\f\n\r\t\v]
	 */
	public function allTrim(str:String):String
	{
		return str.replace(/\s/g, "");
	}
}

