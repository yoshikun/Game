package com.yo.game.net
{
    import com.yo.framework.net.IProtocol;
    import com.yo.framework.net.IResponse;
	import com.yo.game.net.response.login.LoginResultResponse;
	import com.yo.game.net.response.login.LoginSuccessResponse;
	import com.yo.game.net.response.login.LoginResultResponse;
	import com.yo.game.net.response.login.SelectRoleInfoResponse;
	public class Protocol implements IProtocol
	{
		private static var _protoMap:Object = {
		
		};
		
		/**
		 * 登录到登陆服返回结果 一般返回的都是错误信息
		 */
		public static const LOGIN_RESULT:Object = {
			module: 1,
			action: 2//
		};
		
		/**
		 * 登录成功返回登陆信息
		 */
		public static const LOGIN_SUCCESS:Object = {
			module: 1,
			action: 3//
		};
		
		/**
		 * 登录到网关返回结果
		 */
		public static const LOGIN_RESULT:Object = {
			module: 1,
			action: 6//
		};
		
		/**
		 * 该区所有的角色信息 长度为0时 请发注册协议 为1时 直接发选择角色协议 &gt;1时 玩家选择后再发协议
		 */
		public static const SELECT_ROLE_INFO:Object = {
			module: 1,
			action: 7//
		};
		
		public function Protocol()
		{
		
		}
		
		/**
		 * 查找协议 
		 */        
		public function lookup(module:uint, action:uint):IResponse {
		    var c:Class = _protoMap[_toString(module, action)];
		    if (! c) {
		        return null;
		    }
			return new c;
		}
		
		/**
		 * 注册协议 
		 */    
		public function register():void {
			_protoMap[_key(LOGIN_RESULT)] = LoginResultResponse;
			_protoMap[_key(LOGIN_SUCCESS)] = LoginSuccessResponse;
			_protoMap[_key(LOGIN_RESULT)] = LoginResultResponse;
			_protoMap[_key(SELECT_ROLE_INFO)] = SelectRoleInfoResponse;
			}
		
		private static function _key(o:Object):String {
			return _toString(o.module, o.action);
		}
		
		private static function _toString(module:uint, action:uint):String {
			return module + ':' + action;
		}
	}
}