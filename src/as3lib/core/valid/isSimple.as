package as3lib.core.valid
{
	/**
	 * @param 
	 * @return 
	 */
	public function isSimple(object:Object):Boolean
	{
		switch (typeof(object))
		{
			case "number":
			case "string":
			case "boolean":
				return true;
			case "object":
				return (object is Date) || (object is Array);
		}
		return false;
	}
}