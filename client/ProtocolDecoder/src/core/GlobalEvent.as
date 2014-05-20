package core
{
	import flash.events.Event;
	
	public class GlobalEvent extends Event
	{
		public static const BUILD_COMPLETE:String = "build_complete";
		
		private var _data:Object;
		
		public function GlobalEvent(type:String, data:Object, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			_data = data;
			super(type, bubbles, cancelable);
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