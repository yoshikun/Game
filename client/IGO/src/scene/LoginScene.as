package scene
{
	import com.yo.logger.Log;
	import com.yo.net.ProtocolEvent;
	
	import flash.events.Event;
	import flash.system.Security;
	
	import core.Config;
	
	import enum.State;
	
	import net.NetManager;
	import net.Protocol;
	import net.request.system.LoginGateRequest;
	import net.request.system.LoginRequest;
	import net.response.system.LoginResponse;
	
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
		
		/**
		 * 结果 0成功,1维护 2未到开服时间 3网关未开
		 */		
		private function __loginResponse(e:ProtocolEvent):void
		{
			var r:LoginResponse = e.response as LoginResponse;
			switch(r.result){
				case 0:
					Log.getLog(this).debug("登陆成功");
					SceneManager.instance.changeState(State.LOAD_SCENE);
					break;
				case 1:
					break;
				case 2:
					break;
				case 3:
					break;
				default:
					break;
			}
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