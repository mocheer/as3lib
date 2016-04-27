/**
 * @author gyb 20141124
 */
package as3lib.helper.load
{
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.soap.LoadEvent;
	import mx.rpc.soap.WebService;

	public class WebServiceHelper
	{
		//================================================= 属性==============================================
		public static var Instance:WebServiceHelper = new WebServiceHelper();
		//================================================= 方法==============================================
		public function loadWSDL(wsdl:String,operation:String,...parmArr):WebService
		{
			return loadWSDLing(wsdl,operation,parmArr);
		}
		public function loadWSDLing(wsdl:String,operation:String,parmArr:Array):WebService
		{
			var webService:WebService = new WebService();
			webService.wsdl = wsdl;
			webService.addEventListener(LoadEvent.LOAD,onLoad);  //成功注册连接的监听
			webService.addEventListener(ResultEvent.RESULT,onResult);  //返回正确结果的监听  
			webService.addEventListener(FaultEvent.FAULT,onFault);  //返回错误结果的监听
			webService.loadWSDL();
			webService.getOperation(operation).send.apply(null,parmArr);
			return webService;
		}
		//================================================= 事件==============================================
		private function onLoad(event:LoadEvent):void
		{
			trace(event.type);
		}
		private function onResult(event:ResultEvent):void
		{
			trace(event.result);
		}
		private function onFault(event:FaultEvent):void
		{
			trace(event.fault);
		}
		private function removeEvent():void
		{
			
		}
	}
}