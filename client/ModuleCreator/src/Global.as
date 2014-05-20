package
{
	import flash.utils.Dictionary;

	public class Global
	{
		public static var outputPath:String;
		
		public static var controllerPath:String;
		
		public static var modelPath:String;
		
		public static var viewPath:String;
		
		public static var itemPath:String;
		
		public static var iDataPath:String;
		
		/**
		 * 模块名 
		 */		
		public static var moduleName:String;
		
		/**
		 * 包名 
		 */		
		public static var packageName:String;
		
		/**
		 * 模板 
		 */		
		public static const tplMap:Dictionary = new Dictionary();
		
		public function Global()
		{
		}
	}
}