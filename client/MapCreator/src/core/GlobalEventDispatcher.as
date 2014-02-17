package core
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.Dictionary;

	public class GlobalEventDispatcher
	{
		private static var _dispatcher:EventDispatcher = new EventDispatcher();
		public static var count:int = 0;
		public static var recorder:Boolean = false;
		public static var log:Array = [];
		
		public static function dispatchEvent(eName:String, data:Object = null):void{
			_dispatcher.dispatchEvent(new GlobalEvent(eName, data));
		}
		
		public static function addEventListener(eName:String, callback:Function):void{
			count ++;
			if (recorder) {
				var data:Object = {};
				data.name = eName;
				data.callback = callback;
				log.push(data);
			}
			_dispatcher.addEventListener(eName, callback, false, 0, true);
		}
		
		public static function removeEventListener(eName:String, callback:Function):void{
			count --;
			if (recorder) {
				for each (var d:Object in log) {
					if (d.name == eName && d.callback == callback) {
						log.splice(log.indexOf(d), 1);
						break;
					}
				}
			}
			_dispatcher.removeEventListener(eName, callback);
		}
	}
}