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
	import com.yo.game.net.response.data.MainUserDataResponse;
	import com.yo.game.net.response.data.SetHpAndMpDataResponse;
	import com.yo.game.net.response.data.TimeSyncResponse;
	import com.yo.game.net.response.data.MapScreenSizeDataResponse;
	import com.yo.game.net.response.mapscene.AddUserAndPosMapScreenStateResponse;
	import com.yo.game.net.response.mapscene.RemoveUserMapScreenResponse;
	import com.yo.game.net.response.mapscene.UserMoveResponse;
	import com.yo.game.net.response.magic.AddUserSkillResponse;
	import com.yo.game.net.request.login.LoginRequest;
	import com.yo.game.net.request.login.LoginSuccessRequest;
	import com.yo.game.net.request.login.VerifyVersionRequest;
	import com.yo.game.net.request.login.LoginGateRequest;
	import com.yo.game.net.request.login.SelectRoleInfoRequest;
	import com.yo.game.net.request.login.CheckNameRequest;
	import com.yo.game.net.request.login.CreateSelectUserRequest;
	import com.yo.game.net.request.data.MainUserDataRequest;
	import com.yo.game.net.request.data.SetHpAndMpDataRequest;
	import com.yo.game.net.request.data.TimeSyncRequest;
	import com.yo.game.net.request.data.MapScreenSizeDataRequest;
	import com.yo.game.net.request.mapscene.AddUserAndPosMapScreenStateRequest;
	import com.yo.game.net.request.mapscene.RemoveUserMapScreenRequest;
	import com.yo.game.net.request.mapscene.UserMoveRequest;
	import com.yo.game.net.request.magic.AddUserSkillRequest;
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
		
		/**
		 * 人物主数据
		 */
		public static const MAIN_USER_DATA:String = "2:2";
		
		/**
		 * 设置人物的红和蓝
		 */
		public static const SET_HP_AND_MP_DATA:String = "2:4";
		
		/**
		 * 时间同步
		 */
		public static const TIME_SYNC:String = "2:6";
		
		/**
		 * 人物地图信息
		 */
		public static const MAP_SCREEN_SIZE_DATA:String = "2:8";
		
		/**
		 * 地图上增加一个人物
		 */
		public static const ADD_USER_AND_POS_MAP_SCREEN_STATE:String = "3:2";
		
		/**
		 * 地图上删除一个人物
		 */
		public static const REMOVE_USER_MAP_SCREEN:String = "3:4";
		
		/**
		 * 占位
		 */
		public static const USER_MOVE:String = "3:6";
		
		/**
		 * 添加技能及升级技能的返回
		 */
		public static const ADD_USER_SKILL:String = "4:2";
		
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
			_protoMap[MAIN_USER_DATA] = MainUserDataResponse;
			_protoMap[SET_HP_AND_MP_DATA] = SetHpAndMpDataResponse;
			_protoMap[TIME_SYNC] = TimeSyncResponse;
			_protoMap[MAP_SCREEN_SIZE_DATA] = MapScreenSizeDataResponse;
			_protoMap[ADD_USER_AND_POS_MAP_SCREEN_STATE] = AddUserAndPosMapScreenStateResponse;
			_protoMap[REMOVE_USER_MAP_SCREEN] = RemoveUserMapScreenResponse;
			_protoMap[USER_MOVE] = UserMoveResponse;
			_protoMap[ADD_USER_SKILL] = AddUserSkillResponse;
			}
		
		private static function _toString(module:uint, action:uint):String {
			return module + ":" + action;
		}
	}
}