package com.yo.game.core
{
	public class PlayerModel
	{
		private static var _instance:PlayerModel;
		
		/**
		 * 账号ID
		 */
		public var accid:uint;
		
		/**
		 * 角色ID
		 */
		public var charid:uint;
		
		/**
		 * 昵称
		 */
		public var nickName:String;
		
		/**
		 * 国家
		 */
		public var country:uint;
		
		/**
		 * 等级
		 */
		public var level:uint;
		
		/**
		 * 头像
		 */
		public var face:uint;
		
		/**
		 * 角色掩码
		 */
		public var bitmask:uint;
		
		public function PlayerModel()
		{
		}

		public static function get instance():PlayerModel
		{
			if(!_instance)
			{
				_instance = new PlayerModel();
			}
			return _instance;
		}

	}
}