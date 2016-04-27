package as3lib.core.valid.string
{
	/**
	   Determines if credit card is valid using the Luhn formula.

	   @param value: The credit card number.
	   @return Returns <code>true</code> if String is a valid credit card number; otherwise <code>false</code>.
	 */
	public function isCreditCard(value:String):Boolean
	{
		if (value.length < 7 || value.length > 19 || Number(value) < 1000000)
			return false;

		var pre:Number;
		var sum:Number = 0;
		var alt:Boolean = true;

		var i:Number = value.length;
		while (--i > -1)
		{
			if (alt)
				sum += Number(value.substr(i, 1));
			else
			{
				pre = Number(value.substr(i, 1)) * 2;
				sum += (pre > 8) ? pre -= 9 : pre;
			}

			alt = !alt;
		}

		return sum % 10 == 0;
	}
}