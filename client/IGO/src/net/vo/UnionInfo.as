/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 公会信息
     */
    public class UnionInfo
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
         * 创建者角色ID
         */
        public var createID:uint;

        /**
         * 创建者名字
         */
        public var createName:String;

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
         * 创建时间
         */
        public var createTime:uint;

        /**
         * 公会资金
         */
        public var money:uint;

        /**
         * 公会积分
         */
        public var score:uint;

        /**
         * 公会基地等级
         */
        public var baseLevel:uint;

        /**
         * 公会基地当前经验
         */
        public var baseExp:uint;

        /**
         * 公会公告
         */
        public var note:String;

        /**
         * 平均战斗力
         */
        public var combat:uint;

    }
}