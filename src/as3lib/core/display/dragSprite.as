package as3lib.core.display
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;


	/**
	 * 调用对象的startDrag方法，可平移所有继承Sprite的对象
	 * @author gyb
	 **/
	public function dragSprite(sprite:Sprite,bounds:Rectangle):void
	{
		sprite.addEventListener(MouseEvent.MOUSE_DOWN,sprite_mouseDownHandler);
		function sprite_mouseDownHandler(event:MouseEvent):void
		{
			if(!bounds.contains(event.localX,event.localY))
			{
				return;
			}
			sprite.startDrag(false);
			sprite.addEventListener(MouseEvent.MOUSE_UP,sDrag);
			function sDrag(event:MouseEvent):void
			{
				sprite.stopDrag();
				sprite.removeEventListener(MouseEvent.MOUSE_UP,sDrag);
			}
		}
	}

}