package com.yo.mvc.notify
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	/**
	 * 模块消息机
	 */	
	public class Notifier extends EventDispatcher implements IEventDispatcher
	{
		private static var _instance:Notifier = new Notifier();
		
		public function Notifier(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public static function dispatchEvent(eName:String, data:Object = null):void{
			_instance.dispatchEvent(new Notification(eName, data));
		}
		
		public static function addEventListener(eName:String, callBack:Function):void{
			_instance.addEventListener(eName, callBack, false, 0, true);
		}
		
		public static function removeEventListener(eName:String, callBack:Function):void{
			_instance.removeEventListener(eName, callBack);
		}
	}
}