package as3lib.core.valid.string
{
	/**
	 *
	 */
	public function isQQ(value:String):Boolean
	{
		var pattern:RegExp = new RegExp("^[1-9]*[1-9][0-9]*$");
		return value.match(pattern) != null;
	}
}

