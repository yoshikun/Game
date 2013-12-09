package core
{
	import flash.events.Event;

	public class GlobalEvent extends Event
	{
		public static const CONNECT:String = "connect";
		
		private var _data:Object;
		
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