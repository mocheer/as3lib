/**
 * @author gyb 20141124
 */
package as3lib.helper.load
{
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class HTTPServiceHelper
	{
		//================================================= 属性==============================================

		//================================================= 方法==============================================
		public static function send(url:String,method:String = "GET",parameters:Object = null):HTTPService
		{
			return sending(url,method,parameters);
		}
		private static function sending(url:String,method:String = "GET" , parameters:Object = null):HTTPService
		{
			var httpService:HTTPService = new HTTPService();
			httpService.method = method;
			httpService.url = url;
			httpService.addEventListener(ResultEvent.RESULT,onResult);
			httpService.addEventListener(FaultEvent.FAULT,onFault);
			httpService.send(parameters);   
			return httpService;
		}
		//================================================= 事件==============================================
		private static function onResult(event:ResultEvent):void
		{
			trace(event.result);
		}
		private static function onFault(event:FaultEvent):void
		{
			trace(event.fault);
		}
		private static function removeEvent():void
		{
			
		}
	}
}