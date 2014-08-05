package
{
	import flash.display.BitmapData;

	public class MapModel
	{
		public var bitmapData:BitmapData;
		
		public var nodeList:String = "";
		
		public var items:String = "";
		
		public var path:String = "";
		
		public var mapName:String = "";
		
		public var mapWidth:Number = 0.0;
		
		public var mapHeight:Number = 0.0;
		
		public var loadType:int;
		
		public var cellWidth:int;
		
		public var cellHeight:int;
		
		public var row:int;
		
		public var col:int;
		
		public var sliceWidth:int;
		
		public var sliceHeight:int;
		
		public var preloadX:int;
		
		public var preloadY:int;
		
		/**
		 * 保存时将空白区域转换为
		 *  0道路
		 *  1障碍
		 */
		public var roadType:int;
		
		public function MapModel()
		{
		}
	}
}