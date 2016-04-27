package as3lib.core
{
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	/**
	 * 位图辅助类：九宫格缩放
	 * 这个方法是实现位图Scale9缩放的关键，使用BitmapData.draw和图像矩阵Matrix来实现功能
	 * @param source 源位图数据
	 * @param w 调整后所需的宽度
	 * @param h 调整后所需的高度
	 * @param scaleInfo scale9定义缩放的矩形范围
	 * @return 处理后的位图数据
	 * @author gyb 20140801
	 */        
	public function getScaledBitmapData(source:BitmapData,w:Number,h:Number,scaleInfo:Rectangle):BitmapData 
	{
		var bmpData:BitmapData = new BitmapData(w,h,true,0x000000);
		var matrix:Matrix = new Matrix();
		//绘制后的图像数据的剪裁区域，它用来定义绘制后的位图数据哪些部分是需要保留的，类似于遮罩，不处于这个区域内部的像素将被忽略
		//对于Scale9来说，我们需要定义9个这样的裁剪区域，分别对应文章示意图中的9个区域
		var clipRect:Rectangle;
		//区域3的宽度
		var offsetRight:Number = source.width - scaleInfo.right;
		//区域7的高度
		var offsetBottom:Number = source.height - scaleInfo.bottom;
		var left:Number = scaleInfo.left;
		var top:Number = scaleInfo.top;
		//注意下面的循环，分别对应Scale9的9个区域，每个区域需要设置相应的裁剪区域，并使用Matrix来让图像缩放或移动位置
		for(var i:uint=1;i<10;i++) {
			switch(i) {
				case 1:
					clipRect = new Rectangle(0,0,left,top);
					break;
				case 2:
					clipRect = new Rectangle(left,0,w-offsetRight-left,top);
					matrix.a = clipRect.width/scaleInfo.width;
					matrix.tx = clipRect.x - clipRect.x * matrix.a;
					break;
				case 3:
					clipRect = new Rectangle(w-offsetRight,0,offsetRight,top);
					matrix.tx = w - source.width;
					break;
				case 4:
					clipRect = new Rectangle(0,top,left,h-top-offsetBottom);
					matrix.d = clipRect.height/scaleInfo.height;
					matrix.ty = clipRect.y - clipRect.y * matrix.d;
					break;
				case 5:
					clipRect = new Rectangle(left,top,w-left-offsetRight,h-top-offsetBottom);
					matrix.a = clipRect.width/scaleInfo.width;
					matrix.d = clipRect.height/scaleInfo.height;
					matrix.tx = clipRect.x - clipRect.x * matrix.a;
					matrix.ty = clipRect.y - clipRect.y * matrix.d;
					break;
				case 6:
					clipRect = new Rectangle(w-offsetRight,top,offsetRight,h-top-offsetBottom);
					matrix.d = clipRect.height/scaleInfo.height;
					matrix.tx = w - source.width;
					matrix.ty = clipRect.y - clipRect.y * matrix.d;
					break;
				case 7:
					clipRect = new Rectangle(0,h-offsetBottom,left,offsetBottom);
					matrix.ty = h - source.height;
					break;
				case 8:
					clipRect = new Rectangle(left,h-offsetBottom,w-left-offsetRight,offsetBottom);
					matrix.a = clipRect.width/scaleInfo.width;
					matrix.tx = clipRect.x - clipRect.x * matrix.a;
					matrix.ty = h - source.height;
					break;
				case 9:
					clipRect = new Rectangle(w-offsetRight,h-offsetBottom,offsetRight,offsetBottom);
					matrix.tx = w - source.width;
					matrix.ty = h - source.height;
					break;
			}
			bmpData.draw(source,matrix,null,null,clipRect,true);
			matrix.identity();
		}
		return bmpData;
	}
}