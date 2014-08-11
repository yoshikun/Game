package
{
	import flash.display.BitmapData;

	public class BuildingInfo
	{
		public var id:String = "";
		
		public var name:String = "";

		public var path:String = "";
		
		public var px:Number = 0.0;
		
		public var py:Number = 0.0;
		
		public var tx:Number = 0.0;
		
		public var ty:Number = 0.0;
		
		public var originX:Number = 0.0;
		
		public var originY:Number = 0.0;
		
		public var hinder:String = "";
		
		public var type:String = "";
		
		public var bitmapData:BitmapData;
		
		public var cellWidth:Number;
		
		public var cellHeight:Number;
		
		public function BuildingInfo()
		{
		}
	}
}