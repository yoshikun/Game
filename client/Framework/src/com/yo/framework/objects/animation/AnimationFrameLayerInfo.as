package com.yo.framework.objects.animation
{
	import com.yo.framework.mvc.interfaces.IDisposable;
	
	import flash.display.BitmapData;
	
	public class AnimationFrameLayerInfo implements IDisposable
	{
		/**
		 * 注册点x 
		 */		
		public var registrationX:Number;
		
		/**
		 * 注册点y
		 */		
		public var registrationY:Number;
		
		/**
		 * 图素
		 */		
		public var texture:BitmapData;
		
		public function AnimationFrameLayerInfo()
		{
		}
		
		public function dispose():void
		{
		}
	}
}