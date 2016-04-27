package as3lib.helper.load
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.Socket;
	import flash.utils.ByteArray;

	/**
	 * @author gyb
	 * @date：2015-4-9 下午01:47:00
	 */
	public class SocketHelper
	{
		//Event==========================================================================================================
		
		//Attribute=======================================================================================================
		/** Socket 套接字*/
		public var socket:Socket;
		/**域名或者主机Ip*/
		public var host:String="localhost";
		/**通讯端口*/
		public var port:int=1111;
		/**接收数据的类型*/
		public var RecieveDataType:String="";
		/**发送数据的类型*/
		public var SendDataType:String="";
		/**通讯状态*/
		private var stateMap:Object;
		/**当前通讯状态*/
		private var currentState:int;
		/**字符类型*/
		public static const CHARS:String="chars";
		/** 字节类型 */
		public static const BYTES:String="bytes";
		//Constructor==================================================================================================
		public function SocketHelper()
		{
			socket = new Socket(); 
			socket.addEventListener(Event.CONNECT,onConnect);//监听是否连接上服务器
			socket.addEventListener(Event.CLOSE,onClose);//监听服务器是否关闭
			socket.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
			socket.addEventListener(ProgressEvent.SOCKET_DATA,onSocketData);
			socket.connect("localhost",8080); //连接服务器 , 参数 host:String,prot:int
		}
		
		//Function========================================================================================================
		public function connect():void
		{
			if(!socket.connected)
			{
				socket.connect(host,port);
			}
		}
		public function close():void
		{
			socket.close();
		}
		/**
		 * 写入数据
		 */
		public function WriteDate():void
		{
			if(socket.connected){
				
			}
		}
		//EventHandler===================================================================================================
		private function onConnect(event:Event):void 
		{
			trace("正在连接服务器...");
		}
		private function onClose(event:Event):void 
		{
			trace("正在与服务器断开连接...");
		}
		private function onIOError(event:IOErrorEvent):void 
		{
			trace("流错误，正在与服务器断开连接！"+event.text);
		}
		/**
		 * 处理Socket接收数据
		 */
		private function onSocketData(e:ProgressEvent):void
		{
			if(RecieveDataType==BYTES)
			{
				var bytes:ByteArray;
				socket.readBytes(bytes);
			}else if(RecieveDataType==CHARS)
			{
				var recieveData:String=socket.readUTFBytes(socket.bytesAvailable);
			}
		}
		
	}
}

