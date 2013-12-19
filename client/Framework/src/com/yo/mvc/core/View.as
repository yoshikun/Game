package com.yo.mvc.core
{
	import com.yo.mvc.interfaces.IModel;
	import com.yo.mvc.interfaces.IView;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	
	/**
	 * 视图管理器, 相当于Mediator
	 */	
	public class View extends Sprite implements IView
	{
		protected var _model:IModel;
		
		protected var _asset:MovieClip;
		
		public function View(model:IModel)
		{
			_model = model;
			
			init();
		}
		
		protected function init():void
		{
			initModel();
			initView();
			initEvent();
		}
		
		/**
		 * 初始化面板数据
		 */		
		protected function initModel():void
		{
			
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
		
		public function show():void{
			
		}
		
		public function hide():void{
			
		}
		
		public function update():void{
			
		}
		
		public function dispose():void
		{
			
		}
	}
}