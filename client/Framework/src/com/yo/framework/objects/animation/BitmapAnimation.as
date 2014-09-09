package com.yo.framework.objects.animation
{
	import com.yo.framework.objects.SpriteSheet;

	public class BitmapAnimation extends Animation
	{
		protected var _spriteSheet:SpriteSheet;
		
		public function BitmapAnimation()
		{
			super();
		}
		
		public function initWithSpriteSheet(frames:Vector.<AnimationFrameInfo>, info:AnimationInfo, spriteSheet:SpriteSheet):void
		{
			_spriteSheet = spriteSheet;
		}
		
		override public function dispose():void
		{
			super.dispose();
			if(_spriteSheet)
			{
				_spriteSheet.dispose();
			}
		}
	}
}