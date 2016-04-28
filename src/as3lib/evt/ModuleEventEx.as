/**
 * 日期：2011-11-01
 * 功能：模块加载事件
 */
package as3lib.evt
{
	import as3lib.helper.module.core.ModuleInfo;
	
	import mx.events.ModuleEvent;
	import mx.modules.IModuleInfo;
	
	public class ModuleEventEx extends ModuleEvent 
	{
		private var m_oModuleInfo:ModuleInfo;
		public function ModuleEventEx(type:String, bubbles:Boolean=false, cancelable:Boolean=false, bytesLoaded:uint=0, bytesTotal:uint=0, errorText:String=null, module:IModuleInfo=null, moduleInfo:ModuleInfo = null) 
		{
			super(type, bubbles, cancelable, bytesLoaded, bytesTotal, errorText, module);
			m_oModuleInfo = moduleInfo;
		}
		
		public function get moduleInfo():ModuleInfo {
			return m_oModuleInfo;
		}
	}
}