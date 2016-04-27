package as3lib.core.toggle
{
	import flash.display.Stage;
	import flash.display.StageDisplayState;

	/**
	 * Toggles the stage display state between normal and fullscreen.
	 * @param 
	 * @returns string for state
	 * @author  gyb
	 */
	public function toggleFullScreen(stage:Stage):String
	{
		var state:String;
		if (stage.displayState == StageDisplayState.FULL_SCREEN) {
			state = StageDisplayState.NORMAL;
		} else {
			state = StageDisplayState.FULL_SCREEN;
		}
		stage.displayState = state;
		return state;
	}
}