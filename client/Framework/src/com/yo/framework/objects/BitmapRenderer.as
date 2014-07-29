package com.yo.framework.objects
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	public class BitmapRenderer extends Bitmap implements IRenderer
	{
		public function BitmapRenderer(bitmapData:BitmapData=null, pixelSnapping:String="auto", smoothing:Boolean=false)
		{
			super(bitmapData, pixelSnapping, smoothing);
		}
		
		public function dispose():void
		{
		}
		
		public function render()
		{
			
		}
	}
}