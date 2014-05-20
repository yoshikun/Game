package ui
{
	public class MapVO
	{
		/**
		 * 障碍列表,0表示不是障碍,1表示是障碍 
		 */		
		public var collideList:Array = [];
		
		public var x:int;
		
		public var y:int;
		
		public var column:int;
		
		public var row:int;
		
		public var mapID:int = 10000;
		
		public function MapVO()
		{
		}
	}
}