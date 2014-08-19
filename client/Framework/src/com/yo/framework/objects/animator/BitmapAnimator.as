package com.yo.framework.objects.animator
{
	import br.com.stimuli.loading.loadingtypes.LoadingItem;
	
	import com.yo.framework.interfaces.IAnimation;
	import com.yo.framework.manager.resource.ResourceManager;
	import com.yo.framework.objects.animation.BitmapAnimation;
	
	import flash.events.Event;
	import flash.system.LoaderContext;
	import flash.utils.ByteArray;

	/**
	 * 动画器
	 */    
	public class BitmapAnimator extends Animator
	{
		public function BitmapAnimator(name:String, type:String)
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
			
		}

	}
}