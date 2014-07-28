package com.yo.game.ui.login
{
	import com.yo.framework.core.SharedObjectManager;
	import com.yo.framework.logger.Log;
	import com.yo.framework.manager.resource.ResourceManager;
	import com.yo.framework.mvc.core.BaseController;
	import com.yo.framework.net.ProtocolEvent;
	import com.yo.game.core.Config;
	import com.yo.game.core.GlobalEvent;
	import com.yo.game.core.GlobalEventDispather;
	import com.yo.game.enum.State;
	import com.yo.game.net.NetManager;
	import com.yo.game.net.Protocol;
	import com.yo.game.net.request.login.LoginGateRequest;
	import com.yo.game.net.response.login.LoginGateResponse;
	import com.yo.game.net.response.login.LoginResponse;
	import com.yo.game.scene.SceneManager;
	
	import flash.events.Event;
	
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
			NetManager.instance.addEventListener(Protocol.LOGIN_GATE, __loginGateResponse);
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
		private function __loginGateResponse(e:ProtocolEvent):void
		{
			var r:LoginGateResponse = e.response as LoginGateResponse;
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
			requestLoginGate();
		}
		
		private function requestLoginGate():void
		{
			var data:Object = {account:model.account};
			SharedObjectManager.instance.setProperty(data);
			
			var r:LoginGateRequest = new LoginGateRequest();
			r.accid = uint(model.account);
			r.desKey = "";
			r.loginTempID = 0;
			NetManager.instance.send(r);
		}
		
		override protected function initModel():void{
			_model = new LoginModel();
		}
		
		override protected function initView():void{
			super.initView();
			_view = new LoginView(_model);
		}
		override protected function loadResource():void{
			loadResourceName("Login");
		}
		
		public function get model():LoginModel{
			return _model as LoginModel;
		}
		
		override public function dispose():void{
			super.dispose();
			
			GlobalEventDispather.removeEventListener(GlobalEvent.LOGIN_BTN_CLICK, __loginBtnClick);
			
			NetManager.instance.removeEventListener(Event.CONNECT, __connect);
			NetManager.instance.removeEventListener(Protocol.LOGIN_GATE, __loginGateResponse);
			
			ResourceManager.instance.clearLoader("Login");
		}
	}
}