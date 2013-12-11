package scene
{
	import com.yo.net.ProtocolEvent;
	
	import flash.events.Event;
	
	import core.Config;
	
	import enum.State;
	
	import net.NetManager;
	import net.request.system.LoginGateRequest;
	
	import ui.LoginController;

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
			_loginController.show();
		}
		
		override protected function initEvent():void{
			NetManager.instance.connect(Config.host, Config.port);
			
			NetManager.instance.addEventListener(Event.CONNECT, __connect);
		}
		
		override protected function initView():void{
			
		}
		
		private function __loginResponse(e:ProtocolEvent):void
		{
			SceneManager.instance.changeState(State.LOAD_SCENE);
		}
		
		private function __connect(e:Event):void
		{
			requestLoginGate();
		}
		
		private function requestLoginGate():void
		{
			var request:LoginGateRequest = new LoginGateRequest();
			request.accid = uint(2);
			request.key = 0;
			NetManager.instance.send(request);
		}
		
		override public function update():void{
			super.update();
		}
		
		override public function exit():void{
			super.exit();
		}
		
		override public function dispose():void{
			super.dispose();
		}
	}
}