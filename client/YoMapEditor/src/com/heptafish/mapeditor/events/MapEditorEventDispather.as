package com.heptafish.mapeditor.events
{
	import com.heptafish.mapeditor.events.MapEditorEvent;
	
	import flash.events.EventDispatcher;
	
	public class MapEditorEventDispather
	{
		private static const _dispatcher:EventDispatcher = new EventDispatcher();
		
		public function MapEditorEventDispather()
		{
		}
		
		public static function dispatchEvent(type:String, data:Object = null):void{
			_dispatcher.dispatchEvent(new MapEditorEvent(type, data));
		}
		
		public static function addEventListener(type:String, callback:Function):void{
			_dispatcher.addEventListener(type, callback, false, 0, true);
		}
		
		public static function removeEventListener(type:String, callback:Function):void{
			_dispatcher.removeEventListener(type, callback);
		}
	}
}