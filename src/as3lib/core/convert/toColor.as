package as3lib.core.convert
{
	/**
	 * 解析颜色（十六进制或HTML）为uint的字符串表示。
	 */
	public function toColor(str:String):uint
	{
		if (str.substr(0, 2) == '0x')
		{
			str = str.substr(2);
		}else if (str.substr(0, 1) == '#')
		{
			str = str.substr(1);
		}
		return parseInt(str, 16);
	}
}