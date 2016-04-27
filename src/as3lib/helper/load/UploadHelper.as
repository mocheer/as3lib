package as3lib.helper.load
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.FileFilter;
	import flash.net.FileReference;
	import flash.net.URLRequest;
	
	import mx.controls.Alert;
	import mx.controls.ProgressBar;
	
	/**
	 * 功能：文件上传 
	 */
	public class UploadHelper
	{
		//================================================= 属性==============================================
		public static var Instance:UploadHelper = new UploadHelper();
		
		private var allTypes:Array;
		private var requestUrl:String;
		//================================================= 方法==============================================
		public function upLoad(url:String=null):Boolean
		{
			requestUrl = requestUrl;
			pickfile();
			return true;
		}
		private function initTypes():void
		{
			var imageTypes:FileFilter = new FileFilter("图片 (*.jpg, *.jpeg, *.gif,*.png)", "*.jpg; *.jpeg; *.gif; *.png");
			var textTypes:FileFilter  = new FileFilter("文本文件(*.txt","*.txt;");
			var officeType:FileFilter = new FileFilter("Office文件(*.doc, *.xls","*.doc; *.xls");
			var anyType:FileFilter    = new FileFilter("所有文件(*.*)","*.*");
			
			allTypes = new Array(anyType,imageTypes, textTypes,officeType);
		}
		private function pickfile():void{
		
			if(allTypes==null)initTypes();
			var fileReference:FileReference = new FileReference();
			fileReference.addEventListener(Event.SELECT, selectHandler);
			fileReference.addEventListener(Event.COMPLETE, completeHandler);
			fileReference.addEventListener(ProgressEvent.PROGRESS, progressHandler);
			fileReference.addEventListener(IOErrorEvent.IO_ERROR, ioerrorHandler);
			try{
				var success:Boolean = fileReference.browse(allTypes);
			}catch (error:Error){
				trace("Unable to browse for files."+error.toString());
			}
		}
		private function ioerrorHandler(event:Event):void{
			trace("Unable to upload file."+event.toString());
		}
		private  function progressHandler(event:ProgressEvent):void{
			var progressBar:ProgressBar = new ProgressBar
			var progressMessage:String = " 已上传 " + (event.bytesLoaded/1024).toFixed(2)+ " K，共 " + (event.bytesTotal/1024).toFixed(2) + " K";
			var proc: uint = event.bytesLoaded / event.bytesTotal * 100;
			progressBar.setProgress(proc, 100);
			progressBar.label= "当前进度: " + " " + proc + "%";
		}
		private function selectHandler(event:Event):void
		{
			var request:URLRequest = new URLRequest(requestUrl);
			try
			{
				event.currentTarget.upload(request);
			}
			catch (error:Error)
			{
				trace("Unable to upload file."+error.toString());
			}
		}
		private function completeHandler(event:Event):void{
			trace("uploaded");
		}
	}
}