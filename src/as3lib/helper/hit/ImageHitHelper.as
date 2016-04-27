package as3lib.helper.hit 
{
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.geom.Matrix;
	import flash.geom.Point;
	
	import mx.managers.PopUpManager;

	public class ImageHitHelper
	{
		public static function isHit(object:DisplayObject, point:Point):Boolean {
			
			if(object is BitmapData) 
			{
				return (object as BitmapData).hitTest(new Point(0,0), 0, object.globalToLocal(point));
			}	
			else {
				if(!object.hitTestPoint(point.x, point.y, true)) 
				{
					return false;
				}	
				else {
				
					var bmapData:BitmapData = new BitmapData(object.width, object.height, true, 0x00000000);
					bmapData.draw(object, new Matrix()); 
					var returnVal:Boolean = bmapData.hitTest(new Point(0,0), 0, object.globalToLocal(point)); 
					bmapData.dispose(); 
					return returnVal;
				}
			}
		}
	}
}