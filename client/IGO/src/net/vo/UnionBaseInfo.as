/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 公会基础信息
     */
    public class UnionBaseInfo
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
         * 公会等级
         */
        public var level:uint;

        /**
         * 会长的角色ID
         */
        public var leaderID:uint;

        /**
         * 会长的名字
         */
        public var leaderName:String;

        /**
         * 公会当前人数
         */
        public var curnum:uint;

        /**
         * 公会上限人数
         */
        public var maxnum:uint;

        /**
         * 公会状态
         */
        public var state:uint;

        /**
         * 平均战斗力
         */
        public var combat:uint;

    }
}