package com.yo.framework.objects
{
	import com.yo.framework.interfaces.IAnimation;
	import com.yo.framework.interfaces.IAnimator;

	public class Animator implements IAnimator
	{
		protected var _visible:Boolean;
		
		public function Animator()
		{
		}
		
		public function get animations():Vector.<IAnimation>
		{
			return null;
		}
		
		public function set animations(value:Vector.<IAnimation>):void
		{
		}
		
		public function getAnimation(name:String):IAnimation
		{
			return null;
		}
		
		public function play(name:String):int
		{
			return 0;
		}
		
		public function render():void
		{
			
		}
		
		public function update():void
		{
		}
		
		public function dispose():void
		{
		}

		public function get visible():Boolean
		{
			return _visible;
		}

		public function set visible(value:Boolean):void
		{
			_visible = value;
		}

	}
}