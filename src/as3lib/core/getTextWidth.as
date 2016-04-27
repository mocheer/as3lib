package as3lib.core
{
	public function getTextWidth(text:String,size:int=12):int
	{
		var textWidth:Number=0;
		var at:Number = 0 ;
		var ch:String = ' ';
		var numWidth:int = size - 3;
		//下个字符
		while(ch)
		{
			ch = text.charAt(at);
			at += 1;
			if(("A" <= ch) && (ch <= "Z") || ch==" ")
			{
				textWidth += numWidth;
			}else
			{
				textWidth += size;
			}
		}
		return textWidth;
	}	
}