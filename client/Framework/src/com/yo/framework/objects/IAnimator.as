package com.yo.framework.objects
{
	import com.yo.framework.mvc.interfaces.IDisposable;
	import com.yo.framework.mvc.interfaces.IUpdateable;

	public interface IAnimator extends IUpdateable, IDisposable
	{
		public function get animations():Vector.<IAnimation>;
		
		public function set animations(value:Vector.<IAnimation>):void;
		
		public function getAnimation(name:String):IAnimation;
		
		public function play(name:String):int;
	}
}