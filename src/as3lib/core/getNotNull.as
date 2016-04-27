package as3lib.core
{
	public function getNotNull(...params):* 
	{
		for each(var item:* in params)
		{
			if(item!=null)
			{
				return item;
			}
		}
	}
}
