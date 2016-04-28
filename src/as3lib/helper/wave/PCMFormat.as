package as3lib.helper.wave
{
	import flash.utils.ByteArray; 
	
	public class PCMFormat {
		
		/*
		* *********************************************************
		* CLASS PROPERTIES
		* *********************************************************
		*
		*/
		public var channels:uint;
		public var sampleRate:uint;
		public var byteRate:uint;
		public var blockAlign:uint;
		public var bitsPerSample:uint;
		public var waveDataLength:uint;
		public var fullDataLength:uint;
		
		public static const HEADER_SIZE:uint = 44;
		
		/*
		* *********************************************************
		* CONSTRUCTOR
		* *********************************************************
		*
		*/
		public function PCMFormat() {
			
		}
		
		/*
		* *********************************************************
		* PUBLIC METHODS
		* *********************************************************
		*
		*/
		public function analyzeHeader(byteArray:ByteArray):void {
			var typeArray:ByteArray = new ByteArray();
			byteArray.readBytes(typeArray,0,4);
			
			if (typeArray.toString() != 'RIFF') {
				throw new Error("Decode error: incorrect RIFF header");
				return;
			}
			
			fullDataLength = byteArray.readUnsignedInt()+8;
			byteArray.position = 0x10;
			var chunkSize:Number = byteArray.readUnsignedInt();
			
			if (chunkSize != 0x10) {
				throw new Error("Decode error: incorrect chunk size");
				return;
			}
			
			var isPCM:Boolean = Boolean(byteArray.readShort());
			
			if (!isPCM) {
				throw new Error("Decode error: this file is not PCM wave file");
				return;
			}
			
			channels = byteArray.readShort();
			sampleRate = byteArray.readUnsignedInt();
			
			switch (sampleRate) {
				case 44100:
				case 22050:
				case 11025:
				case 5512:
					break;
				default:
					throw new Error("Decode error: incorrect sample rate");
					return;
			}
			
			byteRate = byteArray.readUnsignedInt();
			blockAlign = byteArray.readShort();
			bitsPerSample = byteArray.readShort();
			byteArray.position += 0x04;
			waveDataLength = byteArray.readUnsignedInt();
			
			if (!blockAlign) {
				blockAlign = channels*bitsPerSample/8;
			}
			
			byteArray.position = 0;
		}
	}
}