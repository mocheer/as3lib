package as3lib.core.js
{
	import flash.net.URLRequest;
	import flash.net.navigateToURL;

	/**
	 * 刷新
	 */
	public function reloadJS():void
	{
		navigateToURL(new URLRequest("javascript:location.reload();"),"_self");
	}
}

