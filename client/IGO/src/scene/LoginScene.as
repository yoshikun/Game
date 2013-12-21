package scene
{
	import com.yo.logger.Log;
	
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
			Log.getLog(this).debug("进入登陆场景");
		}
		
		override protected function initController():void{
			_loginController = new LoginController();
			_loginController.show();
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