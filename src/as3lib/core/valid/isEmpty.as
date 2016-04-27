package as3lib.core.valid
{
	/**
	 *@param
	 *@return
	 */
	public function isEmpty(obj:*):Boolean {
		if(obj == undefined)
			return true;

		if(obj is Number)
			return isNaN(obj);

		if(obj is Array || obj is String)
			return obj.length == 0;

		if(obj is Object) {
			for(var prop:String in obj)
				return false;

			return true;
		}
		return false;
	}
}
