/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 宠物操作信息
     */
    public class PetInfo
    {
        /**
         * 玩家id
         */
        public var userID:uint;

        /**
         * 数据ID
         */
        public var baseID:uint;

        /**
         * 0不可建造 1可建造
         */
        public var state:uint;

        /**
         * 技能个数
         */
        public var skillNum:uint;

        /**
         * 宠物个数
         */
        public var num:uint;

    }
}