package view
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	
	import utils.IsoObject;

	public class BitmapTile extends IsoObject
	{
		public var tileName:String;			//元件在资源配置文件中的名字，用于简化存储和读取。
		
		public function BitmapTile(tilename:String,size:Number,bitmapData:BitmapData,offsetX:Number,offsetY:Number)
		{
			super(size);
			tileName=tilename;
			var pic:Bitmap=new Bitmap(bitmapData);
			pic.x=-offsetX;
			pic.y=-offsetY;
			addChild(pic);
		}
	}
}