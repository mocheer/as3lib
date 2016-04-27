package as3lib.core.array
{
	/**
	 * 去除所有重复项
	 */
	public  function duplicateAllBySplice(sourceArray:Array):void
	{
		for (var i:int = 0; i < sourceArray.length; i++) 
		{ 
			var item:*  = sourceArray[i];
			duplicateItemBySplice(sourceArray,item);
		}
	}
	
}

