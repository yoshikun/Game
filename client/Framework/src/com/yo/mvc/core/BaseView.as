package com.yo.mvc.core
{
	import com.yo.mvc.interfaces.IModel;
	import com.yo.mvc.interfaces.IView;
	
	
	/**
	 * 视图管理器, 相当于Mediator
	 */	
	public class BaseView extends BaseComponent implements IView
	{
		protected var _model:IModel;
		
		public function BaseView(model:IModel = null)
		{
			_model = model;
		}
		
		override protected function init():void
		{
			super.init();
			initModel();
		}
		
		/**
		 * 初始化面板数据
		 */		
		protected function initModel():void
		{
			
		}
		
		public function show():void{
			update();
		}
		
		public function hide():void{
			
		}
	}
}