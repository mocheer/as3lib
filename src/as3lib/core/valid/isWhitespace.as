package as3lib.core.valid
{
	public function isWhitespace(character:String):Boolean
	{
		switch (character)
		{
			case " ":
			case "\t":
			case "\r":
			case "\n":
			case "\f":
				return true;
			default:
				return false;
		}
	}
}