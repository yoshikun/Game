package view
{
	import flash.display.DisplayObject;
	
	import utils.IsoObject;
	
	public class GraphicTile extends IsoObject
	{
		public function GraphicTile(size:Number,classRef:Class,offsetX:Number,offsetY:Number)
		{
			super(size);
			var pic:DisplayObject=new classRef() as DisplayObject;
			pic.x=-offsetX;
			pic.y=-offsetY;
			addChild(pic);
		}
	}
}