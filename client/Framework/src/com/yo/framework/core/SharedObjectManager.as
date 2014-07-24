package com.yo.framework.core
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.NetStatusEvent;
	import flash.net.SharedObject;
	import flash.utils.getQualifiedClassName;
	
	public class SharedObjectManager extends EventDispatcher
	{
		private var _so:SharedObject;
		
		private static var _instance:SharedObjectManager;
		
		public function SharedObjectManager()
		{
			
		}
		
		public function setup():void{
			_so = SharedObject.getLocal("game");
			_so.addEventListener(NetStatusEvent.NET_STATUS, __onStatus);
		}
		
		private function __onStatus(e:NetStatusEvent):void
		{
			switch (e.info.code)
			{
				case "SharedObject.Flush.Success":
					dispatchEvent(new Event(Event.COMPLETE));
					break;
				
				case "SharedObject.Flush.Failed":
					dispatchEvent(new Event(Event.CANCEL));
					break;
			}
		}
		
		public function setProperty(obj:Object):void
		{
			var prop:String;
			for(prop in obj)
			{
				_so.data[prop] = obj[prop];
				_so.flush();
			}
		}
		
		public function getProperty(name:String):String
		{
			if(_so.data[name]){
				return _so.data[name];
			}
			return "";
		}
		
		public function clear():void
		{
			_so.clear();
		}
		
		public override function toString():String 
		{
			return getQualifiedClassName(this);
		}

		public static function get instance():SharedObjectManager
		{
			if(!_instance){
				_instance = new SharedObjectManager();
			}
			return _instance;
		}

	}
}