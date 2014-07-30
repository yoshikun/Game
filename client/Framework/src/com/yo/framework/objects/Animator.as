package com.yo.framework.objects
{
	import com.yo.framework.interfaces.IAnimation;
	import com.yo.framework.interfaces.IAnimator;

	public class Animator implements IAnimator
	{
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
		
		public function update():void
		{
		}
		
		public function dispose():void
		{
		}
	}
}