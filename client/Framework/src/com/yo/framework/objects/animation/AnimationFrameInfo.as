package com.yo.framework.objects.animation
{
	import com.yo.framework.utils.Vector2D;
	
	import flash.geom.Point;
	import flash.geom.Rectangle;

	public class AnimationFrameInfo extends AnimationFrameLayerInfo
	{
		public var frameIndex:int;
		
		public var textureIndex:int;
		
		public var head:Vector2D;
		
		public var hand:Vector2D;
		
		public var body:Vector2D;
		
		public var gravity:Vector2D;
		
		public var shoot:Vector2D;
		
		/**
		 * 受击盒 
		 */		
		public var bbox:Rectangle;
		
		/**
		 * 攻击盒 
		 */		
		public var abox:Rectangle;
		
		public function AnimationFrameInfo()
		{
			abox = new Rectangle();
			bbox = new Rectangle();
		}
	}
}