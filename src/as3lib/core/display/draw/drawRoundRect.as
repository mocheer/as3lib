package as3lib.core.display.draw
{
	import flash.display.Graphics;

	/**
	   Draws a rounded rectangle. Act identically to <code>Graphics.drawRoundRect</code> but allows the specification of which corners are rounded.

	   @param graphics: The location where drawing should occur.
	   @param x: The horizontal position of the rectangle.
	   @param y: The vertical position of the rectangle.
	   @param width: The width of the rectangle.
	   @param height: The height of the rectangle.
	   </code>
	 */
	public function drawRoundRect(graphics:Graphics, x:Number, y:Number, 
								  width:Number, height:Number,cornorRadius:Number=4,
								  backgroundColor:uint = 0xa3c6f5,backgroundAlpha:Number=0.6,
								  borderAlpha:Number = 0.91,borderColor:uint = 0x2166a5,
								  borderThickness:Number = 1):void
	{
		graphics.lineStyle(borderThickness, borderColor, borderAlpha, true);
		//绘制左上边线条
		graphics.moveTo(x + cornorRadius, y + height); //移动到左下角
		graphics.curveTo(x, y + height, x, y + height - cornorRadius); //左下角圆角
		graphics.lineTo(x, y + cornorRadius);
		graphics.curveTo(x, y, x + cornorRadius, y); //左上角圆角
		graphics.lineTo(x + width - cornorRadius, y);
		graphics.curveTo(x + width, y, x + width, y + cornorRadius);
		//右下两边线条
		graphics.moveTo(x + width, y + cornorRadius);
		graphics.lineTo(x + width, y + height - cornorRadius);
		graphics.curveTo(x + width, y + height, x + width - cornorRadius, y + height); //右下角圆角
		graphics.lineTo(x + cornorRadius, y + height);
		//绘制内部白色边框及背景
		graphics.lineStyle(1, 0xffffff, 1, true);
		graphics.beginFill(backgroundColor, backgroundAlpha);
		graphics.drawRoundRect(x + 1, y + 1, width - 2, height - 2, 2 * cornorRadius, 2 * cornorRadius);
		graphics.endFill();
		
	
	}
}