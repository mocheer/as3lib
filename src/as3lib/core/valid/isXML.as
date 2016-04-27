package as3lib.core.valid
{
	/**
	 * Checks whether the specified string is valid and well formed XML.
	 * @param data The string that is being checked to see if it is valid XML.
	 * @return A Boolean value indicating whether the specified string is valid XML.
	 */
	public function isXML(data:String):Boolean
	{
		var xml:XML;

		try
		{
			xml = new XML(data);
		}catch (e:Error)
		{
			return false;
		}

		return xml.nodeKind() == "element";
	}
}