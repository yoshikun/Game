package com.yo.game.core
{
	import flash.display.Stage;

	public class Global
	{
		/**
		 * 帧频
		 */		
		public static var frameRate:Number;
		
		/**
		 * 主舞台 
		 */		
		public static var stage:Stage;
		
		/**
		 * 登录状态 
		 */		
		public static var loginState:int;
		
		/**
		 * 服务器 
		 */		
		public static var host:String;
		
		/**
		 * 端口 
		 */		
		public static var port:uint;
		
		/**
		 * 调试模式 
		 */		
		public static var debug:Boolean;
		
		/**
		 * 语言
		 */
		public static var lang:String = "zh_cn";
		
		/**
		 * 资源路径
		 */
		public static var resourcePath:String;
		
		/**
		 * 加密路径 
		 */		
		public static var encryptResourcePath:String;
		
		/**
		 * 加密 
		 */		
		public static var encrypt:Boolean;
		
		public static function getAssetPath():String{
			var path:String = Global.resourcePath;
			if(encrypt){
				path = Global.encryptResourcePath;
			}
			return path + Global.lang + "/";
		}
	}
}