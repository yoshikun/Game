package com.yo.game.core
{
	import flash.events.Event;

	public class GlobalEvent extends Event
	{
		/**
		 * 登陆 
		 */		
		public static const CONNECT:String = "connect";
		
		public static const LOGIN_BTN_CLICK:String = "login_btn_click";
		
		public static const REGIST_BTN_CLICK:String = "registBtnClick";
		
		public static const DECODE_COMPLETE:String = "decode_complete";
		
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