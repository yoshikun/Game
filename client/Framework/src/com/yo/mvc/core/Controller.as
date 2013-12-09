package com.yo.mvc.core
{
	import com.yo.manager.resource.ResourceManager;
	import com.yo.mvc.interfaces.IController;
	import com.yo.mvc.interfaces.IModel;
	import com.yo.mvc.interfaces.IView;
	
	import flash.events.Event;
	
	/**
	 * 控制器
	 */	
	public class Controller implements IController
	{
		protected var _view:IView;
		
		protected var _model:IModel;
		
		/**
		 * 资源是否已经加载 
		 */		
		protected var _resourceLoaded:Boolean = false;
		
		public function Controller()
		{
			init();
		}
		
		/**
		 * 请求数据(不能再这里初始化任何东西)
		 */		
		public function setup():void
		{
			
		}
		
		/**
		 * 初始化监听器和数据
		 */		
		protected function init():void
		{
			initModel();
			initEvent();
		}
		
		protected function initEvent():void
		{
			
		}
		
		protected function initModel():void
		{
			
		}
		
		/**
		 * 验证是否加载资源功能
		 */		
		public function show():void{
			if(!_resourceLoaded){
				loadResource();
			}else{
				showView();
			}
		}
		
		protected function update():void{
			if(_view){
				_view.update();
			}
		}
		
		/**
		 * 外界通过Notification来调用
		 */		
		protected function hide():void{
			if(_view){
				_view.hide();
			}
		}
		
		protected function loadResource():void
		{
			
		}
		
		protected function loadResourceName(name:String):void{
			ResourceManager.instance.loadResource(name, "swf", __loadComplete);
		}
		
		/**
		 * 加载完成
		 */		
		protected function __loadComplete(e:Event):void
		{
			_resourceLoaded = true;
			show();
		}
		
		/**
		 * 仅在需要显示视图的时候尝试初始化视图
		 */		
		protected function showView():void{
			if(!_view){
				initView();
			}
			_view.show();
		}
		
		/**
		 * 初始化界面管理器
		 */		
		protected function initView():void
		{
			
		}
		
		public function dispose():void
		{
			
		}
	}
}