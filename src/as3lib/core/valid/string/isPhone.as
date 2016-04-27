package as3lib.core.valid.string
{
	/**
	 *
	 */
	public function isPhone(value:String):Boolean
	{
		var pattern:RegExp = new RegExp("(\d{3}-|\d{4}-)?(\d{8}|\d{7})?");
		return value.match(pattern) != null;
	}
}

