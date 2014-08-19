package com.yo.game.ui.login
{
	import com.yo.framework.core.SharedObjectManager;
	import com.yo.framework.manager.resource.ResourceManager;
	import com.yo.framework.manager.ui.UIManager;
	import com.yo.framework.mvc.core.BaseView;
	import com.yo.framework.mvc.interfaces.IModel;
	import com.yo.game.core.GlobalEvent;
	import com.yo.game.core.GlobalEventDispatcher;
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	public class LoginView extends BaseView
	{
		private var _loginBtn:SimpleButton;
		
		private var _registBtn:SimpleButton;
		
		private var _accountTf:TextField;
		
		private var _passwordTf:TextField;
		
		public function LoginView(model:IModel)
		{
			super(model);
		}
		
		override protected function initView():void{
			super.initView();
			
			_asset = ResourceManager.instance.create("login.MainAsset") as MovieClip;
			this.addChild(_asset);
			
			_loginBtn = _asset["loginBtn"];
			_registBtn = _asset["registBtn"];
			
			_accountTf = _asset["accountTf"];
			_accountTf.text = SharedObjectManager.instance.getProperty("account");
			
			_passwordTf = _asset["passwordTf"];
			_passwordTf.displayAsPassword = true;
		}
		
		override protected function initEvent():void{
			_loginBtn.addEventListener(MouseEvent.CLICK, __loginBtnClick);
			_registBtn.addEventListener(MouseEvent.CLICK, __registBtnClick);
		}
		
		protected function __loginBtnClick(event:MouseEvent):void
		{
			getData();
			GlobalEventDispatcher.dispatchEvent(GlobalEvent.LOGIN_BTN_CLICK);
		}
		
		private function getData():void
		{
			model.account = _accountTf.text;
			model.password = _passwordTf.text;
		}
		
		protected function __registBtnClick(event:MouseEvent):void
		{
			getData();
			GlobalEventDispatcher.dispatchEvent(GlobalEvent.REGIST_BTN_CLICK);
		}
		
		override public function show():void{
			super.show();
			
			UIManager.instance.addChild(this);
		}
		
		private function get model():LoginModel{
			return _model as LoginModel;
		}
		
		override public function dispose():void{
			super.dispose();
			
			if(_loginBtn)
			{
				_loginBtn.removeEventListener(MouseEvent.CLICK, __loginBtnClick);
				_loginBtn = null;
			}
			if(_registBtn)
			{
				_registBtn.removeEventListener(MouseEvent.CLICK, __registBtnClick);
				_registBtn = null;
			}
		}
	}
}