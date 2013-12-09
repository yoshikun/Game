/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 赛跑npc
     */
    public class NpcRaceInfo
    {
        /**
         * id
         */
        public var id:uint;

        /**
         * 赔率
         */
        public var odds:uint;

        /**
         * 0未出战 1出战选手
         */
        public var state:uint;

        /**
         * 出战次数
         */
        public var joinNum:uint;

        /**
         * 胜利次数
         */
        public var winNum:uint;

        /**
         * 投注金额
         */
        public var gold:uint;

    }
}