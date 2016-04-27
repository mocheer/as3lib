/**
 * @author gyb 2013-12-29
 */
package as3lib.helper
{
	/**
	 * 日期时间工具类 :提供时间日期的操作
	 */
	public  class DateHelper
	{
		public static const MILLISECOND:Number= 1;
		public static const SECOND_IN_MILLISECOND:Number=MILLISECOND * 1000;
		public static const MINUTE_IN_MILLISECOND:Number=SECOND_IN_MILLISECOND * 60;
		public static const HOUR_IN_MILLISECOND:Number=MINUTE_IN_MILLISECOND * 60;
		public static const DAY_IN_MILLISECOND:Number=HOUR_IN_MILLISECOND * 24;
		public static const WEEK_IN_MILLISECOND:Number=DAY_IN_MILLISECOND * 7;
		
		/**
		 * @param date
		 * @param addDay
		 * @return
		 */
		public static function addDaysByDateTime(date:Date, addDay:Number):Date
		{
			return new Date(date.getTime() + addDay * DAY_IN_MILLISECOND);
		}
		/**
		 * @return The next month
		 */
		public static function getNextMonth(currentDate:Date):Date
		{
			var returnDate:Date=new Date(currentDate.getTime());
			returnDate.setMonth(returnDate.getMonth() + 1, returnDate.getDate());
			return returnDate;
		}
		/**
		 * @return The last month
		 */
		public static function getLastMonth(currentDate:Date):Date
		{
			var returnDate:Date=new Date(currentDate.getTime());
			returnDate.setMonth(returnDate.getMonth() - 1, returnDate.getDate());
			return returnDate;
		}
		/**
		 * @return The next year
		 */
		public static function getNextYear(currentDate:Date):Date
		{
			var returnDate:Date=new Date(currentDate.getTime());
			returnDate.setFullYear(returnDate.getFullYear() + 1);
			return returnDate;
		}
		/**
		 * @return The last year
		 */
		public static function getLastYear(currentDate:Date):Date
		{
			var returnDate:Date=new Date(currentDate.getTime());
			returnDate.setFullYear(returnDate.getFullYear() - 1);
			return returnDate;
		}
		/**
		 * @return The fist day of the next month 
		 */
		public static function getFristDayOfMonth(currentDate:Date):Date
		{
			currentDate.setMonth(currentDate.getMonth(), 1); //下个月的第一天，也就是下个月1号
			return currentDate;
		}
		/**
		 *  @return The fist day of the last month 
		 */
		public static function getLastDayOfMonth(currentDate:Date):Date
		{
			currentDate.setMonth(currentDate.getMonth() + 1, 1); //下个月的第一天，也就是下个月1号
			currentDate.setDate(currentDate.getDate() - 1); //下个月1号之前1天，也就是本月月底
			return currentDate;
		}
		/**
		 * 获取日期的中文表示方式(注：0表示星期天)
		 * @param currentDate
		 * @return
		 */
		public static function getChineseDay(currentDate:Date):String
		{
			switch (currentDate.getDay())
			{
				case 0:
					return "星期日";
				case 1:
					return "星期一";
				case 2:
					return "星期二";
				case 3:
					return "星期三";
				case 4:
					return "星期四";
				case 5:
					return "星期五";
				case 6:
					return "星期六";
				default:
					return "";
			}
		}
		/**
		 * 获取日期的中文表示方式(注：0表示Sunday)
		 * @param currentDate
		 * @return
		 */
		public static function getEnglishDay(currentDate:Date):String
		{
			switch (currentDate.getDay())
			{
				case 0:
					return "Sunday";
				case 1:
					return "Monday";
				case 2:
					return "Tuesday";
				case 3:
					return "Wednesday";
				case 4:
					return "Thursday";
				case 5:
					return "Friday";
				case 6:
					return "Saturday";
				default:
					return "";
			}
		}
	}
}