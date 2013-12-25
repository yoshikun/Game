package scene
{
	import ui.createRole.CreateRoleController;
	
	public class CreateRoleScene extends GameScene
	{
		private var _createRoleController:CreateRoleController;
		
		public function CreateRoleScene()
		{
			super();
		}
		
		override public function enter():void{
			super.enter();
		}
		
		override protected function initController():void{
			_createRoleController = new CreateRoleController();
		}
		
		override protected function initEvent():void{
			
		}
		
		override protected function initView():void{
			
		}
		
		override public function update():void{
			super.update();
		}
		
		override public function exit():void{
			super.exit();
			
			if(_createRoleController){
				_createRoleController.dispose();
				_createRoleController = null;
			}
		}
		
		override public function dispose():void{
			super.dispose();
		}
	}
}