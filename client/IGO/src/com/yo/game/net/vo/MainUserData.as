/**
 * Copyright (c) 2012, www.yo.com All rights reserved.
 */
package com.yo.game.net.vo
{
    /*@import*/
    /**
     * 人物主数据
     */
    public class MainUserData
    {
        /**
         * 角色ID
         */
        public var charid:uint;

        /**
         * 国家
         */
        public var country:uint;

        /**
         * 等级
         */
        public var level:uint;

        /**
         * 红
         */
        public var hp:uint;

        /**
         * 最大红
         */
        public var maxhp:uint;

        /**
         * 蓝
         */
        public var mp:uint;

        /**
         * 最大蓝
         */
        public var maxmp:uint;

        /**
         * 当前经验
         */
        public var exp:uint;

        /**
         * 升级经验
         */
        public var nextexp:uint;

        /**
         * 角色掩码
         */
        public var bitmask:uint;

    }
}