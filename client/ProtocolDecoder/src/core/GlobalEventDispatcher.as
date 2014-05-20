package core
{
	import flash.events.EventDispatcher;

	public class GlobalEventDispatcher
	{
		private static const _dispatcher:EventDispatcher = new EventDispatcher();
		
		public function GlobalEventDispatcher()
		{
		}
		
		public static function dispatchEvent(type:String, data:Object = null):void{
			_dispatcher.dispatchEvent(new GlobalEvent(type, data));
		}
		
		public static function addEventListener(type:String, callback:Function):void{
			_dispatcher.addEventListener(type, callback, false, 0, true);
		}
		
		public static function removeEventListener(type:String, callback:Function):void{
			_dispatcher.removeEventListener(type, callback);
		}
	}
}