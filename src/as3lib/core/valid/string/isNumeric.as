package as3lib.core.valid.string
{
	/**
	 * Validate if a string is composed entirely of numbers.
	 */
	public function isNumeric(value:String):Boolean
	{
		if (value == null)
		{
			return false;
		}
		var regx:RegExp = /^[-+]?\d*\.?\d+(?:[eE][-+]?\d+)?$/;
		return regx.test(value);
	}
}