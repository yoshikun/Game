/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 公会用户信息
     */
    public class UnionMemberInfo
    {
        /**
         * 公会ID
         */
        public var unionID:uint;

        /**
         * 用户ID
         */
        public var userID:uint;

        /**
         * 用户角色昵称
         */
        public var nickName:String;

        /**
         * 用户公会别称
         */
        public var aliasName:String;

        /**
         * 用户性别 0未知 1男 2女
         */
        public var sex:uint;

        /**
         * 用户等级
         */
        public var level:uint;

        /**
         * 用户权限  1普通会员权限 2管理员权限 4会长权限
         */
        public var power:uint;

        /**
         * 加入时间
         */
        public var joinTime:uint;

        /**
         * 最后活跃时间
         */
        public var lastupdate:uint;

        /**
         * 有效贡献度
         */
        public var donate:uint;

        /**
         * 总贡献度
         */
        public var allDonate:uint;

        /**
         * 个人积分
         */
        public var score:uint;

        /**
         * 用户状态
         */
        public var state:uint;

        /**
         * 战斗力
         */
        public var combat:uint;

        /**
         * 0不在线 1在线
         */
        public var online:uint;

        /**
         * 可修筑基地次数
         */
        public var baselimit:uint;

    }
}