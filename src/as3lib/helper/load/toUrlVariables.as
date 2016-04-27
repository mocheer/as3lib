package as3lib.helper.load
{
	import flash.net.URLVariables;

	/**
	 * 
	 */
	internal function toUrlVariables(_data:Object):URLVariables
	{
		var _result:URLVariables = new URLVariables();
		for (var _key:String in _data)
		{
			_result[_key] = _data[_key];
		}
		return _result;
	}
}