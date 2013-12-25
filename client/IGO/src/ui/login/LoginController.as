package ui.login
{
	import com.yo.logger.Log;
	import com.yo.manager.resource.ResourceManager;
	import com.yo.mvc.core.BaseController;
	import com.yo.mvc.core.BaseModel;
	import com.yo.net.ProtocolEvent;
	
	import flash.events.Event;
	
	import core.Config;
	import core.GlobalEvent;
	import core.GlobalEventDispather;
	
	import enum.State;
	
	import net.NetManager;
	import net.Protocol;
	import net.request.system.LoginGateRequest;
	import net.request.system.LoginRequest;
	import net.response.system.LoginResponse;
	
	import scene.SceneManager;
	
	public class LoginController extends BaseController
	{
		public function LoginController()
		{
			super();
		}
		
		override protected function initEvent():void{
			super.initEvent();
			
			GlobalEventDispather.addEventListener(GlobalEvent.LOGIN_BTN_CLICK, __loginBtnClick);
			
			NetManager.instance.addEventListener(Event.CONNECT, __connect);
			NetManager.instance.addEventListener(Protocol.LOGIN, __loginResponse);
		}
		
		override protected function init():void{
			super.init();
			show();
		}
		
		private function __loginBtnClick(e:GlobalEvent):void
		{
			requestConnect();
		}
		
		/**
		 * 请求连接
		 */		
		private function requestConnect():void
		{
			Log.getLog(this).debug("开始连接 " +　Config.host + ":" + Config.port);
			NetManager.instance.connect(Config.host, Config.port);	
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
		
		/**
		 * 请求登陆
		 */		
		private function requestLogin():void
		{
			var r:LoginRequest = new LoginRequest();
			r.account = model.account;
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
		
		override protected function initModel():void{
			_model = new LoginModel();
		}
		
		override protected function initView():void{
			super.initView();
			_view = new LoginView(_model);
		}
		override protected function loadResource():void{
			loadResourceName("login");
		}
		
		public function get model():LoginModel{
			return _model as LoginModel;
		}
		
		override public function dispose():void{
			super.dispose();
			
			GlobalEventDispather.removeEventListener(GlobalEvent.LOGIN_BTN_CLICK, __loginBtnClick);
			
			NetManager.instance.removeEventListener(Event.CONNECT, __connect);
			NetManager.instance.removeEventListener(Protocol.LOGIN, __loginResponse);
			
			ResourceManager.instance.clearLoader("login");
		}
	}
}