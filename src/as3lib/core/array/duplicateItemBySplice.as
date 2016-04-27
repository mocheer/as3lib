package as3lib.core.array
{
	/**
	 * 去除重复项
	 */
	public function duplicateItemBySplice(sourceArray:Array,item:*):void
	{
		var index:int =  sourceArray.indexOf(item)
		var lastIndex:int =  sourceArray.lastIndexOf(item);
		for (index; index < lastIndex; index++) 
		{   
			sourceArray.splice(lastIndex,1);
			lastIndex = sourceArray.lastIndexOf(item);
		}
	}
}

