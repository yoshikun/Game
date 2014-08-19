package com.yo.framework.objects.animator
{
	import com.yo.framework.interfaces.IAnimation;
	import com.yo.framework.interfaces.IAnimator;

	public class Animator implements IAnimator
	{
		/**
		 * 动画控制器名(某个怪物)
		 */		
		protected var _name:String;
		
		/**
		 * 人物动画,场景动画,特效动画 
		 */	
		protected var _type:String;
		
		/**
		 * 动画列表
		 */		
		protected var _animations:Vector.<IAnimation>;
		
		/**
		 * 动画可视状态 
		 */		
		protected var _visible:Boolean;
		
		/**
		 * 当前动画名 
		 */		
		protected var _currentAnimationName:String;
		
		public function Animator(name:String = "", type:String = "animation")
		{
			_name = name;
			_type = type;
			
			init();
		}
		
		protected function init():void
		{
			
		}
		
		public function getAnimation(animationName:String):IAnimation
		{
			for each (var animation:IAnimation in _animations) 
			{
				if(animation.name == animationName)
				{
					return animation;
				}
			}
			return createAnimation(animationName);
		}
		
		protected function createAnimation(animationName:String):IAnimation
		{
			return null;
		}
		
		public function play(animationName:String):void
		{
			_currentAnimationName = animationName;
		}
		
		public function load():void
		{
			
		}
		
		public function render():void
		{
		}
		
		public function update():void
		{
			var animation:IAnimation = getAnimation(_currentAnimationName);
			if(animation)
			{
				animation.update();
			}
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
		
		public function get animations():Vector.<IAnimation>
		{
			return _animations;
		}
		
		public function set animations(value:Vector.<IAnimation>):void
		{
			_animations = value;
		}
	}
}