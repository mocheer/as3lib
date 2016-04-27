package as3lib.core.string
{
	/**
	 *StringUtil.trimArrayElements:删除数组中每个元素的开头和末尾的所有空格字符，此处数组作为字符串存储。
	 */
	public function trimArrayElements(value:String, delimiter:String):String
	{
		if (value != "" && value != null)
		{
			var items:Array = value.split(delimiter);
			
			var len:int = items.length;
			for (var i:int = 0; i < len; i++)
			{
				items[i] = trim(items[i]);
			}
			
			if (len > 0)
			{
				value = items.join(delimiter);
			}
		}
		return value;
	}

}

