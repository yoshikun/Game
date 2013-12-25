package com.yo.mvc.core
{
	import com.yo.mvc.interfaces.IClearable;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	public class BaseComponent extends Sprite implements IClearable
	{
		protected var _asset:MovieClip;
		
		public function BaseComponent()
		{
			init();
		}
		
		protected function init():void
		{
			initView();
			initEvent();
		}
		
		/**
		 * 初始化view
		 */		
		protected function initView():void
		{
			
		}
		
		/**
		 * 初始化事件
		 */		
		protected function initEvent():void
		{
			
		}
		
		public function update():void{
			
		}
		
		public function dispose():void
		{
			
		}
	}
}