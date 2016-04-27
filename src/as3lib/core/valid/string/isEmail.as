package as3lib.core.valid.string
{
	/**
	 *  @param email: String to verify as email.
	 *  @return 
	 *  @see http://www.regular-expressions.info/email.html Read more about the regular expression used by this method.
	 */
	public function isEmail(value:String):Boolean
	{
		var pattern:RegExp = /^[A-Z0-9._%+-]+@(?:[A-Z0-9-]+\.)+[A-Z]{2,4}$/i;
		return value.match(pattern) != null;
	}
}