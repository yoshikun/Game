package scene
{
	import ui.login.LoginController;

	public class LoginScene extends GameScene
	{
		private var _loginController:LoginController;
		
		public function LoginScene()
		{
			super();
		}
		
		override public function enter():void{
			super.enter();
		}
		
		override protected function initController():void{
			_loginController = new LoginController();
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
			
			if(_loginController){
				_loginController.dispose();
				_loginController = null;
			}
		}
		
		override public function dispose():void{
			super.dispose();
		}
	}
}