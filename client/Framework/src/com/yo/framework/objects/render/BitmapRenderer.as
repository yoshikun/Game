package com.yo.framework.objects.render
{
	import com.yo.framework.interfaces.IAnimator;
	import com.yo.framework.interfaces.IEntity;
	import com.yo.framework.interfaces.IRenderer;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	public class BitmapRenderer extends Bitmap implements IRenderer
	{
		private var _entity:IEntity;
		
		private var _animator:IAnimator;
		
		public function BitmapRenderer(bitmapData:BitmapData=null, pixelSnapping:String="auto", smoothing:Boolean=false)
		{
			super(bitmapData, pixelSnapping, smoothing);
		}
		
		public function dispose():void
		{
		}
		
		public function render():void
		{
			
		}

		public function get entity():IEntity
		{
			return _entity;
		}

		public function set entity(value:IEntity):void
		{
			_entity = value;
		}

		public function get animator():IAnimator
		{
			return _animator;
		}

	}
}