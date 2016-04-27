/**
 * @author gyb 20141209
 */
package as3lib.helper
{
	import flash.display.LoaderInfo;
	import flash.system.ApplicationDomain;
	/**
	 * 域功能辅助类
	 */
	public class DomainHelper
	{
		/**
		 * 功能：获取当前ApplicationDomain内的类定义
		 * @param name类名称，必须包含完整的命名空间,如helper.load.SWFLoader
		 * @param info加载swf的LoadInfo，不指定则从当前域获取
		 * @return 获取的类定义，如果不存在返回null
		 */
		public static function GetClass(name:String, loaderInfo:LoaderInfo = null):Class
		{
			try 
			{
				if (loaderInfo == null) 
				{
					return ApplicationDomain.currentDomain.getDefinition(name) as Class;
				}
				return loaderInfo.applicationDomain.getDefinition(name) as Class;
			} 
			catch (e:ReferenceError) 
			{
				trace("定义'" + name + "'不存在");
				return null;
			}
			return null;
		}
		/**
		 * 获取新建独立域，使用这个域加载类定义可以在应用定义相同的情况下，可以使几个版本并行（会扩大内存）
		 */
		 public static function GetIndependentDomain():ApplicationDomain
		 {
			 return new ApplicationDomain();
		 }
		 /**
		  * 获取当前共享域，使用这个域加载类定义将会增加新的类定义(RSL)（确保当前类定义在子域中没有实例化）
		  */
		 public static function GetCurrentDomain():ApplicationDomain
		 {
			 return ApplicationDomain.currentDomain;
		 }
		 /**
		  * 获取新建子域，使用这个域加载类定义使得子域中的类引用父应用中相同的类定义（当前加载的类定义会被覆盖掉）
		  */
		 public static function GetChildDomain():ApplicationDomain
		 {
			 return new ApplicationDomain(ApplicationDomain.currentDomain);  
		 }
	}
}