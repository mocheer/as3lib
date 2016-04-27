package as3lib.helper.math
{
	public class MathHelper
	{
		/**
		 * 将度为单位表示的角度转换为以弧度为单位表示的角度
		 * @param	degrees	以度为单位的角度
		 * @return	以弧度为单位的角度
		 */
		public static function radians(degrees:Number):Number
		{
			return degrees * Math.PI / 180.0;
		}
		/**
		 * 将弧度为单位表示的角度转换为以度为单位表示的角度
		 * @param	degrees	弧度为单位表示的角度
		 * @return	以度为单位的角度
		 */
		public static function degrees(rad:Number):Number
		{
			return rad * 180.0 / Math.PI  ;
		}
		
	}
}