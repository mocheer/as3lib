/**
 * 创建：trg
 * 日期：2011-10-25
 * 功能：待加载模块信息类
 */
package as3lib.helper.module.core
{
	import mx.modules.IModuleInfo;
	import as3lib.helper.module.ModuleHelper;

	public class ModuleInfo 
	{
		//---------------------------------------------------------------------------------------------------------------
		//    构造函数
		//---------------------------------------------------------------------------------------------------------------
		public function ModuleInfo(key:String, url:String = null, type:int = 1, vars:Object = null) 
		{
			m_sKey = key;
			this.url = url;
			this.type = type;
			this.vars = vars;
		}
		
		//---------------------------------------------------------------------------------------------------------------
		//    属性部分
		//---------------------------------------------------------------------------------------------------------------
		public var m_bCompleted:Boolean;
		public function get completed():Boolean {
			return m_bCompleted;
		}
		
		private var m_sKey:String;
		public function get key():String {
			return m_sKey;
		}
		
		public var m_oModule:*;//internal:可以由类本身或者相同包内的任何类访问;
		public function get module():* {
			return m_oModule;
		}
		
		public var moduleInfo:IModuleInfo;
		
		public var m_oOwner:ModuleHelper;
		public function owner():ModuleHelper {
			return m_oOwner;
		}
		
		public var type:int;
		public var url:String;
		public var vars:Object;
		
		public static const SPECIAL_PROPERTIES:Array = ["addMethodName","applicationDomain","initMethod","initMethodParams","targetContainer","onErrorParams","onError","onProgressParams","onProgress","onReadyParams","onReady"];
		
		//---------------------------------------------------------------------------------------------------------------
		//    方法部分
		//---------------------------------------------------------------------------------------------------------------
		public function callMethod(methodName:String, args:Array):* {
			if (!m_bCompleted) {
				throw new Error("模块尚未加载和初始化完成！");
			}
			return m_oModule[methodName].apply(m_oModule, args);
		}
	}

}