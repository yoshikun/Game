package
{
	import flash.display.Bitmap;

	public class Assets
	{
		[Embed(source="images/icons/shutdown.png")]
		public static const ShutDownBtn:Class;
		
		/**
		 * 点击单选路点后的鼠标图片 
		 */		
		[Embed(source="images/curs/roadPoint.png")]
		public static const CursorRoadPoint:Class;
		
		/**
		 * 点击取消路点后的鼠标图片 
		 */		
		[Embed(source="images/curs/roadCancel.png")]
		public static const CursorRoadCancel:Class;
		
		/**
		 * 点击设置障碍后的鼠标图片 
		 */		
		[Embed(source="images/curs/roadHinder.png")]
		public static const CursorRoadHinder:Class;

		public function Assets()
		{
		}
		
		public static function getTexture(name:String):Bitmap{
			var bitmap:Bitmap = new Assets[name]();
			return bitmap;
		}
	}
}