package as3lib.core.random
{

	/**
	 * @author gyb
	 */
	public function randomCharacters(amount:Number, charSet:String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"):String {
		var alphabet:Array = charSet.split("");
		var alphabetLength:int = alphabet.length;
		var randomLetters:String = "";
		
		for(var j:uint = 0; j < amount; j++) {
			var r:Number = Math.random() * alphabetLength;
			var s:int = Math.floor(r);
			randomLetters += alphabet[s];
		}
		
		return randomLetters;
	}
}
