package as3lib.core.encode
{
	import flash.utils.ByteArray;
	/**
	 *@author gyb 
	 */
	public  function encodeUtf8(obj: Object):String
	{  
		if(obj != null && obj != "undefined"){  
			var oriByteArr: ByteArray = new ByteArray();  
			oriByteArr.writeUTFBytes(obj.toString());  
			var tempByteArr:ByteArray = new ByteArray();  
			for(var i:Number = 0; i < oriByteArr.length; i++){
				
				if(oriByteArr[i] == 194){  
					tempByteArr.writeByte(oriByteArr[i+1]);  
					i++;  
				}else if(oriByteArr[i] == 195){  
					tempByteArr.writeByte(oriByteArr[i+1] + 64);  
					i++;  
				}else{  
					tempByteArr.writeByte(oriByteArr[i]);  
				}  
			}  
			tempByteArr.position = 0;  
			return tempByteArr.readMultiByte(tempByteArr.bytesAvailable, "chinese");  
		}else{  
			return "";  
		}  
	}  
}