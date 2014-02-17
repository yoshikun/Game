package core
{
	import flash.events.Event;
	
	public class GlobalEvent extends Event
	{
		private var _data:Object;
		
		/**
		 * 加载地图完成 
		 */		
		public static const LOAD_MAP_COMPLETE:String = "load_map_complete";
		
		public static const BUTTON_BAR_CLICK:String = "button_bar_click";
		
		public function GlobalEvent(type:String, data:Object = null)
		{
			super(type);
			_data = data;
		}
		
		public function get data():Object
		{
			return _data;
		}
		
		public function set data(value:Object):void
		{
			_data = value;
		}
		
	}
}