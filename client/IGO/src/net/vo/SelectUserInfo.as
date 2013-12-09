/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 角色信息(角色列表使用)
     */
    public class SelectUserInfo
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
         * 账号ID
         */
        public var accid:uint;

        /**
         * 种族 1,2,3
         */
        public var type:uint;

        /**
         * 等级
         */
        public var level:uint;

        /**
         * 性别 1男 2女
         */
        public var sex:uint;

        /**
         * 角色掩码
         */
        public var bitmask:uint;

    }
}