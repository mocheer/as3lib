package  as3lib.core.array
{
	/**
	 * @param first: First Array to compare to the second
	 * @param second: Second Array to compare to the first
	 * @return Returns <code>true</code> if Arrays are the same; otherwise <code>false</code>.
	 */
	public function equals(first:Array, second:Array):Boolean
	{
		var i:uint = first.length;
		if (i != second.length)
			return false;

		while (i--)
			if (first[i] != second[i])
				return false;

		return true;
	}
}