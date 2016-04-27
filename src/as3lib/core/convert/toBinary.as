package as3lib.core.convert
{
	/**
	 * @param	numberInt	待转换为二进制数据的整数
	 * @return	32 位二进制数据
	 */
	public function toBinary(numberInt:int):String
	{
		var PADDING:String = "00000000000000000000000000000000";
		var num:uint = numberInt; // 转换为无符号整数
		var result:String = num.toString(2);
		if (result.length < 32) {
			result = PADDING.slice(result.length)+result;
		}
		return result;
	}
}

