package com.yo.game.net
{
	import com.yo.framework.logger.Log;
	import com.yo.framework.net.ByteSocket;
	import com.yo.framework.net.IRequest;
	import com.yo.game.core.Global;
	
	import flash.events.Event;

	public class NetManager
	{
		private static var _instance:NetManager;
		
		private var _socket:ByteSocket;
		
		public function NetManager():void
		{
			init();
		}
		
		private function init():void{
			_socket = new ByteSocket();
			_socket.protocol = new Protocol();
			_socket.addEventListener(Event.CLOSE, __closeHandler);
			_socket.addEventListener(Event.CONNECT, __connectHandler);
		}
		
		public function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false):void{
			_socket.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		
		public function removeEventListener(type:String, listener:Function, useCapture:Boolean=false):void{
			_socket.removeEventListener(type, listener, useCapture);
		}
		
		protected function __connectHandler(event:Event):void
		{
			Log.getLog(this).debug("连接成功");
		}
		
		public function connect(ip:String, port:int):void
		{
			_socket.connect(ip, port);
		}
		
		public function send(r:IRequest):void{
			_socket.send(r);
		}
		
		private static function __closeHandler(event:Event):void
		{
			var str:String = "断开链接";
			switch(Global.loginState){
				case 2:
					str = "你的账号在其他地方登录";
					break;
				case 3:
					str = "验证错误";
					break;
				case 4:
					str = "网关人数满";
					break;
				case 5:	
					str = "账号被冻结";
					break;
				default:
					str = "断开链接";
					break;
			}
			
//			Alert.show(str, "提示", callBack);
		}
		
		private static function callBack():void
		{
			
		}

		public static function get instance():NetManager
		{
			if(!_instance){
				_instance = new NetManager();
			}
			return _instance;
		}
	}
}