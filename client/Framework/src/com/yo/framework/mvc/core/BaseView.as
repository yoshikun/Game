package com.yo.framework.mvc.core
{
	import com.yo.framework.mvc.interfaces.IModel;
	import com.yo.framework.mvc.interfaces.IView;
	
	/**
	 * 视图管理器, 相当于Mediator
	 */	
	public class BaseView extends BaseComponent implements IView
	{
		protected var _model:IModel;
		
		public function BaseView(model:IModel = null)
		{
			_model = model;
			super();
		}
		
		/**
		 * 初始化
		 */		
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
		
		/**
		 * 显示
		 */		
		public function show():void
		{
			update();
		}
		
		/**
		 * 隐藏
		 */		
		public function hide():void
		{
			if(this.parent)
			{
				this.parent.removeChild(this);
			}
		}
		
		/**
		 * 释放
		 */		
		override public function dispose():void
		{
			super.dispose();
			hide();
		}
	}
}