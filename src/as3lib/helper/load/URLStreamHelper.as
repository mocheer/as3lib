/**
 * @author gyb 20141121
 */
package as3lib.helper.load
{
	import as3lib.core.convert.toUrlVariables;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLStream;
	
	
	
	/**
	 *  URLStream 类提供对下载 URL 的低级访问。 数据一下载，便可随即为应用程序使用，这和使用 URLLoader 时需要等到整个文件下载完不同。并且 URLStream 类还允许在完成下载前关闭流。 已下载文件的内容将作为原始二进制数据提供。        
	 *  在 URLStream 中的读取操作是非阻塞模式的。 这意味着您在读取数据之前必须使用 bytesAvailable 属性来确定是否能够获得足够的数据,如果不能获得足够的数据，将引发 EOFError 异常。  
	 * 	在默认情况下，所有二进制数据都是以 Big-endian 格式编码的，并且最高位字节于第一位。     
	 */
	public class URLStreamHelper
	{
		//================================================= 属性==============================================
		public static var Instance:URLStreamHelper = new URLStreamHelper();
		private var _urlRequest:URLRequest;
		private function get urlRequest():URLRequest
		{
			if(_urlRequest==null)
			{
				_urlRequest = new URLRequest();
			}
			return _urlRequest;
		}
		
		//================================================= 方法==============================================
		/**
		 * 功能：管理加载过程，防止缓存，并简化 URLLoader 复杂的调用方式。
		 */
		public function load(url:String, method:String = URLRequestMethod.POST, data:Object = null):URLStream
		{
			var urlStream:URLStream=new URLStream();
			urlStream.addEventListener(Event.COMPLETE, onHttpResult);
			urlStream.addEventListener(IOErrorEvent.IO_ERROR, onHttpError);
			urlRequest.method = method;
			urlRequest.url = url;
			if(data == null) data = new Object();
			data["requestDate"] = new Date().getTime();
			urlRequest.data = toUrlVariables(data);
			urlStream.load(urlRequest);
			return urlStream;
		}
		//================================================= 事件==============================================
		private function onHttpError(event:IOErrorEvent):void
		{
			var faultLoader:URLStream = event.currentTarget as URLStream;
			faultLoader.close();
		}
		
		private function onHttpResult(event:Event):void
		{
			var resultLoader:URLStream = event.currentTarget as URLStream;
			resultLoader.close();
		}
	}
}