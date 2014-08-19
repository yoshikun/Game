package com.yo.game.ui.login
{
	import com.yo.framework.mvc.interfaces.IModel;
	import com.yo.game.net.vo.SelectUserInfo;
	
	public class LoginModel implements IModel
	{
		public var account:String;
		
		public var password:String;
		
		public function LoginModel()
		{
		}
		
		public function dispose():void
		{
		}
	}
}