package core
{
	import flash.events.EventDispatcher;
	
	public class GlobalEventDispather
	{
		private static var _dispatcher:EventDispatcher = new EventDispatcher();
		
		public static var count:int = 0;
		
		public static function dispatchEvent(eName:String, data:Object = null):void{
			_dispatcher.dispatchEvent(new GlobalEvent(eName, data));
		}
		
		public static function addEventListener(eName:String, callback:Function):void{
			count++;
			_dispatcher.addEventListener(eName, callback, false, 0, true);
		}
		
		public static function removeEventListener(eName:String, callback:Function):void{
			count--;
			_dispatcher.removeEventListener(eName, callback);
		}
	}
}