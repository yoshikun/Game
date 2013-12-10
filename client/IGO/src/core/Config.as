package core
{
	import flash.display.Stage;

	public class Config
	{
		/**
		 * 帧频
		 */		
		public static var frameRate:Number;
		
		public static var stage:Stage;
		
		public static var loginState:int;
		
		public static var resourcePath:String = "";
		
		public static var host:String = "115.28.2.190";
		
		public static var port:uint = 7778;
		
		/**
		 * 语言
		 */
		public static var lang:String = "zh_cn";
		
		/**
		 * 资源路径
		 */
		public static var asset:String = "assets/" + Config.lang + "/";
		
		/**
		 * 加密路径 
		 */		
		public static var encryptAsset:String = "md5Assets/" + Config.lang + "/";
		
		/**
		 * 加密 
		 */		
		public static var encrypt:Boolean;
		
		public static function getAssetPath():String{
			var path:String = Config.asset;
			if(encrypt){
				path = Config.encryptAsset;
			}
			return path;
		}
	}
}