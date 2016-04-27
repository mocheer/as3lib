package as3lib.helper
{
	/**
	 * @author gyb
	 * @date：2015-3-9 下午02:51:12
	 */
	public class RegExpHelper
	{
		/**
		 g  global  匹配多个
		 i  ignoreCase  不区分大小写
		 m  multiline  设置好此标识后，可以使用$和^来匹配行的开头和结尾
		 s  dotall  设置好此标识后，"." 也可以匹配换行符
		 x  extended  允许扩展正则表达式，可以是正则表达式中键入空格，它将作为模
		 */
		
		/**匹配自然数，即非负整数（正整数 + 0）*/
		public static const NaturalNumber:RegExp = /^\d+$/;
		/**匹配正整数*/
		public static const PositiveInt:RegExp = /^[0-9]*[1-9][0-9]*$/;
		/**匹配非正整数（负整数 + 0）*/
		public static const NonPositiveInt:RegExp = /^((-\d+)|(0+))$/;
		/**匹配负整数 */
		public static const NegativeInt:RegExp = /^-[0-9]*[1-9][0-9]*$/;
		/**匹配整数 */
		public static const Integers:RegExp = /^-?\d+$/;
		
		/**匹配中文字符的正则表达式*/
		public static const ChineseChar:RegExp = new RegExp("[\u4e00-\u9fa5]");
		/**匹配双字节字符(包括汉字在内)*/
		public static const DoubleChar:RegExp = new RegExp("[^\x00-\xff]");
		/**匹配空行的正则表达式*/
		public static const NullRow:RegExp = new RegExp("\n[\s| ]*\r");
		/**匹配HTML标记的正则表达式*/
		public static const HtmlFlag:RegExp = new RegExp("<(.*)>.*<\/>|<(.*) \/>");
		/**匹配首尾空格的正则表达式*/
		public static const BothBlanks:RegExp = new RegExp("(^\s*)|(\s*$)");
		/**匹配Email地址的正则表达式*/
		public static const EmailURL:RegExp = new RegExp("\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*");
		/**匹配网址URL的正则表达式*/
		public static const WebURL:RegExp = new RegExp("^[a-zA-z]+://(\w+(-\w+)*)(\.(\w+(-\w+)*))*(\?\S*)?$");
		/**匹配帐号是否合法(字母开头，允许5-16字节，允许字母数字下划线)*/
		public static const AccountLeg:RegExp = new RegExp("^[a-zA-Z][a-zA-Z0-9_]{4,15}$");
		/**匹配国内电话号码*/
		public static const PhoneNumber:RegExp = new RegExp("(\d{3}-|\d{4}-)?(\d{8}|\d{7})?");
		/**匹配腾讯QQ号*/
		public static const QQ:RegExp = new RegExp("^[1-9]*[1-9][0-9]*$");
		
	}
}

