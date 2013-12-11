package scene
{
	import com.yo.logger.Log;
	import com.yo.net.ProtocolEvent;
	
	import core.Config;
	
	import enum.State;
	
	import flash.events.Event;
	
	import net.NetManager;
	import net.Protocol;
	import net.request.system.LoginGateRequest;
	import net.request.system.LoginRequest;
	
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
			
			Log.getLog(this).debug("开始连接 " +　Config.host + ":" + Config.port);
			NetManager.instance.connect(Config.host, Config.port);
		}
		
		override protected function initController():void{
			_loginController = new LoginController();
			_loginController.show();
		}
		
		override protected function initEvent():void{
			NetManager.instance.addEventListener(Event.CONNECT, __connect);
			NetManager.instance.addEventListener(Protocol.LOGIN, __loginResponse);
		}
		
		override protected function initView():void{
			
		}
		
		private function __loginResponse(e:ProtocolEvent):void
		{
			Log.getLog(this).debug("登陆成功");
			SceneManager.instance.changeState(State.LOAD_SCENE);
		}
		
		private function __connect(e:Event):void
		{
			requestLogin();
		}
		
		private function requestLogin():void
		{
			var r:LoginRequest = new LoginRequest();
			r.account = "yoshikun";
			r.gameType = 1000;
			r.gameZone = 1;
			r.netType = 1;
			NetManager.instance.send(r);
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