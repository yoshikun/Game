package com.yo.framework.interfaces
{
	import com.yo.framework.mvc.interfaces.IDisposable;
	import com.yo.framework.mvc.interfaces.IUpdateable;

	public interface IAnimator extends IUpdateable, IDisposable
	{
		function get animations():Vector.<IAnimation>;
		
		function set animations(value:Vector.<IAnimation>):void;
		
		function getAnimation(name:String):IAnimation;
		
		function play(name:String):int;
	}
}