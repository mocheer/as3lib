package as3lib.core.array
{
	/**
	 * 去除所有重复项返回新数组（indexOf）
	 */
	public function duplicateAllBySearch(sourceArray:Array):Array
	{
		var temp:Array=[]
		for(var i:int = 0;i < sourceArray.length;i++){
			if(temp.indexOf(sourceArray[i])==-1){
				temp.push(sourceArray[i])  
			}
		}
		return temp;
	}
}

