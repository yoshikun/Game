/**
 * Copyright (c) 2012, www.yo.com All rights reserved.
 */
package com.yo.game.net.vo
{
    /*@import*/
    /**
     * 角色信息(角色列表使用)
     */
    public class SelectUserInfo
    {
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
         * 性别
         */
        public var sex:uint;

        /**
         * 职业
         */
        public var career:uint;

        /**
         * 角色掩码
         */
        public var bitmask:uint;

    }
}