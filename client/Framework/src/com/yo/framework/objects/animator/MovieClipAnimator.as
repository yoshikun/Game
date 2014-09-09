package com.yo.framework.objects.animator
{
	import br.com.stimuli.loading.loadingtypes.LoadingItem;
	
	import com.yo.framework.interfaces.IAnimation;
	import com.yo.framework.manager.resource.ResourceManager;
	import com.yo.framework.objects.animation.AnimationFrameInfo;
	import com.yo.framework.objects.animation.AnimationInfo;
	import com.yo.framework.objects.animation.BitmapAnimation;
	import com.yo.framework.utils.DisplayObjectUtil;
	
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import flash.system.LoaderContext;

	public class MovieClipAnimator extends Animator
	{
		public function MovieClipAnimator(name:String="", type:String="animation")
		{
			super(name, type);
		}
		
		override protected function init():void
		{
			super.init();
			
			load();
		}
		
		override protected function createAnimation(animationName:String):IAnimation
		{
			var animation:BitmapAnimation = new BitmapAnimation();
			animation.name = animationName;
			return animation;
		}
		
		/**
		 * 加载某个动作的动画
		 */		
		override public function load():void
		{
			var contextName:String = _type + "." + _name;
			var context:LoaderContext = ResourceManager.instance.createContext();
			
			ResourceManager.instance.loadResource(_name, _type, __itemLoadComplete, context);
		}
		
		protected function __itemLoadComplete(e:Event):void
		{
			var item:LoadingItem = e.currentTarget as LoadingItem;
			item.removeEventListener(Event.COMPLETE, __itemLoadComplete);
			
			decode(item);
		}
		
		protected function decode(item:LoadingItem):void
		{
			var mc:MovieClip = item.content as MovieClip;
			if(mc)
			{
				var totalFrames:int = 0;
				var animationName:String = "";
				var len:int = mc.totalFrames;
				for (var j:int = 0; j < len; j++) 
				{
					totalFrames++;
					mc.gotoAndStop(j + 1);
					if(animationName != mc.currentLabel)
					{
						animationName = mc.currentLabel;
						var animation:BitmapAnimation = getAnimation(animationName) as BitmapAnimation;
						var animationInfo:AnimationInfo = new AnimationInfo();
						animationInfo.totalFrames = totalFrames;
						animation.info = animationInfo;
						
						totalFrames = 0;
					}
				}
				
				for (var i:int = 0; i < len; i++) 
				{
					mc.gotoAndStop(i + 1);
					
					var frameInfo:AnimationFrameInfo = new AnimationFrameInfo();
					var bd:BitmapData = new BitmapData(mc.width, mc.height);
					
					advanceChild(mc, i);
					var bounds:Rectangle = DisplayObjectUtil.getDisplayObjectRectangle(mc, true);
//                	var bounds:Rectangle = mc.getBounds(mc);
					bounds.x = Math.floor(bounds.x);
					bounds.y = Math.floor(bounds.y);
					bounds.width = Math.ceil(bounds.width);
					bounds.height = Math.ceil(bounds.height);
					var m:Matrix = new Matrix();
					m.translate(-bounds.x, -bounds.y);
					bd.draw(mc, null, null, null, null, true);
					frameInfo.texture = bd;
					
					animation.frame.push(frameInfo);
				}
			}
		}
		
		private function advanceChild(parent:MovieClip, index:uint):void 
		{
			for (var i:int = 0; i < parent.numChildren; i++) 
			{
				var mc:MovieClip = parent.getChildAt(i) as MovieClip;
				if (!mc)
				{
					continue;
				}
				
				var currentFrame:uint = (index - 1) % mc.totalFrames + 1;
				mc.gotoAndStop(currentFrame);
				
				advanceChild(mc, index);
			}
		}
	}
}