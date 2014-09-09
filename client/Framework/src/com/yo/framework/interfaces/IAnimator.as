package com.yo.framework.interfaces
{
	import com.yo.framework.mvc.interfaces.IDisposable;
	import com.yo.framework.mvc.interfaces.IUpdateable;

	/**
	 * 动画控制器的接口 
	 * @author yoshikun
	 * 
	 */	
	public interface IAnimator extends IComponent
	{
		function get animations():Vector.<IAnimation>;
		
		function set animations(value:Vector.<IAnimation>):void;
		
		function getAnimation(animationName:String):IAnimation;
		
		function play(animationName:String):void;
		
		function get currentAnimation():IAnimation;
	}
}