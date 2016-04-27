package as3lib.core.string
{
	/**
	 * 把 input 里的所有 replace 替换为 replaceWidth
	 * 包括特殊字符[]\^$.|?*+()也会被匹配
	 * @param	input			<b>	String	</b> 源字符串
	 * @param	replaceStr		<b>	String	</b> 要替换的字符串
	 * @param	replaceWidth	<b>	String	</b> 替换后的字符串 default:""
	 * @return
	 */
	public function replace(input:String, replace:String, replaceWith:String = ""):String
	{
		if (!input || !replace || replaceWith == null ) return input;
		
		var replaceStr:String = "";	
		var len:int = replace.length;
		var str:String;
		
		var regChar:String = "[]\^$.|?*+()";//检测特殊字符，在其前面面加上斜杠
		for (var i:int = 0; i < len; i++)
		{
			str = replace.charAt(i)
			if (regChar.indexOf(str) != -1)
			{
				replaceStr += "\\";
			}
			replaceStr += str;
		}
		//全局 g 用于全局匹配，去掉则只匹配第一个
		return input.replace(new RegExp(replaceStr, "g"), replaceWith);
	}
}

