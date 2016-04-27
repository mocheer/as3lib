package as3lib.core.valid.string
{
	import as3lib.core.string.trim;

	/**
	 * Validate if a strings contents are blank after a safety trim is performed.
	 */
	public function isBlank(value:String = null):Boolean
	{
		var str:String = trim(value);
		var i:int = 0;
		if (str.length == 0)
		{
			return true;
		}
		while (i < str.length)
		{
			if (str.charCodeAt(0) != 32)
			{
				return false;
			}
			i++;
		}
		return true;
	}
}