package as3lib.core 
{
	/**
	 * 功能：合并 json 对象。将param参数的key和value复制生成新的json对象，所以属性是以后一个为准。
	 * @param json对象
	 */
	public function getCombinJson(...param:*):*
	{
		if (param.length == 0)
		{
			return null;
		}
		if (param.length == 1)
		{
			return param[0];
		}
		var target:* = { };
		var options:*;
		var src:*;
		var copy:*
		for (var i:int = 0; i < param.length; i++ )
		{
			if ( (options = param[ i ]) != null )
			{
				for (var name:String in options )
				{
					src = target[name];
					copy = options[ name ];
					
					if ( target === copy )
						continue;
					
					if ( copy !== undefined )
					{
						if(!(copy is Array) && (typeof copy) == "object")
						{
							target[ name ] = getCombinJson(src, copy);
						}
						else
						{
							target[ name ] = copy;
						}
					}
				}
			}
		}
		return target;
	}
}