/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 地图中的用户信息,包括状态
     */
    public class MapUserData
    {
        /**
         * 角色ID
         */
        public var userID:uint;

        /**
         * 昵称
         */
        public var nickName:String;

        /**
         * 称谓
         */
        public var caption:String;

        /**
         * 种族 1,2,3
         */
        public var type:uint;

        /**
         * 性别 1男 2女
         */
        public var sex:uint;

        /**
         * 等级
         */
        public var level:uint;

        /**
         * 位置
         */
        public var pos:uint;

        /**
         * 队伍1,2 决定敌对
         */
        public var team:uint;

        /**
         * 时装ID
         */
        public var avatarList:Array /* of uint */;

        /**
         * 公会名称
         */
        public var unionName:String;

        /**
         * vip等级
         */
        public var vip:uint;

        /**
         * 当前生命值
         */
        public var hp:uint;

        /**
         * 最大生命值
         */
        public var maxHP:uint;

        /**
         * 当前能量值
         */
        public var energy:uint;

        /**
         * 最大能量值
         */
        public var maxEnergy:uint;

        /**
         * 移动速度
         */
        public var moveSpeed:uint;

    }
}