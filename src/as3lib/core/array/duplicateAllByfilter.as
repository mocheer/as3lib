package as3lib.core.array
{
	/**
	 * 去除所有重复项返回新数组（filter）
	 */
	public function duplicateAllByfilter(sourceArray:Array):Array
	{
		return sourceArray.filter(callback);
		function callback(item:*, index:int, array:Array):Boolean
		{
			if(array.lastIndexOf(item) == array.indexOf(item))
			{
				return true;
			}
			return false;
		}
	}
}

