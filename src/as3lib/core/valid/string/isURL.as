package as3lib.core.valid.string
{
	/**
	 * Validate as "http://" or "https://".
	 */
	public function isURL(value:String):Boolean
	{
		return (value.substring(0, 7) == "http://" || value.substring(0, 8) == "https://");
	}
}