package as3lib.core.random
{
	/**
	 * Randomly returns either true or false.
	 * 
	 * @author Mims Wright
	 */
	public function randomBoolean():Boolean
	{
		return Math.random() < 0.5;
	}
}