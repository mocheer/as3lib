package as3lib.core.array
{
	/**
	 * Adds all items in inArray and returns the value.
	 * @param inArray: Array composed only of numbers.
	 * @return The total of all numbers in <code>inArray</code> added.
	 */
	public function sum(inArray:Array):Number
	{
		var t:Number = 0;
		var l:uint = inArray.length;

		while (l--)
			t += inArray[l];

		return t;
	}
}