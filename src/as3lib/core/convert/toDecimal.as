package as3lib.core.convert
{
	/**
	 * 将二进制数据转换为数字
	 * @param	binaryRepresentation	待转换的二进制数据
	 * @return				转换后所得的对应整数
	 */
	public  function toDecimal(binaryRepresentation:String):int
	{
		return parseInt(binaryRepresentation, 2);
	}
}

