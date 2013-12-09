package com.yo.mvc.notify
{
	import flash.events.Event;
	
	/**
	 * 模块消息
	 */	
	public class Notification extends Event
	{
		private var _data:Object;
		
		public function Notification(type:String, data:Object, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			
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