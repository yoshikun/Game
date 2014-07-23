package com.yo.game.ui.createRole
{
	import com.yo.framework.mvc.core.BaseController;
	
	public class CreateRoleController extends BaseController
	{
		public function CreateRoleController()
		{
			super();
		}
		
		override protected function init():void{
			super.init();
			show();
		}
		
		override protected function initModel():void
		{
			_model = new CreateRoleModel();
		}
		
		override protected function initView():void{
			_view = new CreateRoleView(_model);
		}
		
		override protected function initEvent():void{
			
		}
		
		override protected function loadResource():void{
			loadResourceName("CreateRole");
		}
		
	}
}