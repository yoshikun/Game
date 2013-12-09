/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 等级排行信息
     */
    public class UnionLvRankInfo
    {
        /**
         * 公会ID
         */
        public var unionID:uint;

        /**
         * 公会名称
         */
        public var unionName:String;

        /**
         * 会长的角色ID
         */
        public var leaderID:uint;

        /**
         * 会长的名字
         */
        public var leaderName:String;

        /**
         * 公会等级
         */
        public var level:uint;

        /**
         * 公会资金
         */
        public var money:uint;

        /**
         * 本次排名
         */
        public var curPostion:uint;

        /**
         * 上次排名
         */
        public var lastPostion:uint;

    }
}