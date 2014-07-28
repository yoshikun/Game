package com.yo.game.net
{
    import com.yo.framework.net.IProtocol;
    import com.yo.framework.net.IResponse;
	import com.yo.game.net.response.login.LoginResponse;
	import com.yo.game.net.response.login.LoginSuccessResponse;
	import com.yo.game.net.response.login.VerifyVersionResponse;
	import com.yo.game.net.response.login.LoginGateResponse;
	import com.yo.game.net.response.login.SelectRoleInfoResponse;
	import com.yo.game.net.response.login.CheckNameResponse;
	import com.yo.game.net.response.login.CreateSelectUserResponse;
	import com.yo.game.net.request.login.LoginRequest;
	import com.yo.game.net.request.login.LoginSuccessRequest;
	import com.yo.game.net.request.login.VerifyVersionRequest;
	import com.yo.game.net.request.login.LoginGateRequest;
	import com.yo.game.net.request.login.SelectRoleInfoRequest;
	import com.yo.game.net.request.login.CheckNameRequest;
	import com.yo.game.net.request.login.CreateSelectUserRequest;
	public class Protocol implements IProtocol
	{
		private static var _protoMap:Object = {
		
		};
		
		/**
		 * 登录到登陆服返回结果 一般返回的都是错误信息
		 */
		public static const LOGIN:String = "1:2";
		
		/**
		 * 登录成功返回登陆信息
		 */
		public static const LOGIN_SUCCESS:String = "1:4";
		
		/**
		 * 占个坑
		 */
		public static const VERIFY_VERSION:String = "1:6";
		
		/**
		 * 登录到网关返回结果
		 */
		public static const LOGIN_GATE:String = "1:8";
		
		/**
		 * 该区所有的角色信息 长度为0时 请发注册协议 为1时 直接发选择角色协议 &gt;1时 玩家选择后再发协议
		 */
		public static const SELECT_ROLE_INFO:String = "1:10";
		
		/**
		 * 返回检查name结果
		 */
		public static const CHECK_NAME:String = "1:12";
		
		/**
		 * 创建角色返回
		 */
		public static const CREATE_SELECT_USER:String = "1:14";
		
		public function Protocol()
		{
			register();
		}
		
		/**
		 * 查找协议 
		 */        
		public function lookup(module:uint, action:uint):IResponse {
		    var c:Class = _protoMap[_toString(module, action)];
		    if (!c) {
		        return null;
		    }
			return new c;
		}
		
		/**
		 * 注册协议 
		 */    
		public function register():void {
			_protoMap[LOGIN] = LoginResponse;
			_protoMap[LOGIN_SUCCESS] = LoginSuccessResponse;
			_protoMap[VERIFY_VERSION] = VerifyVersionResponse;
			_protoMap[LOGIN_GATE] = LoginGateResponse;
			_protoMap[SELECT_ROLE_INFO] = SelectRoleInfoResponse;
			_protoMap[CHECK_NAME] = CheckNameResponse;
			_protoMap[CREATE_SELECT_USER] = CreateSelectUserResponse;
			}
		
		private static function _toString(module:uint, action:uint):String {
			return module + ":" + action;
		}
	}
}