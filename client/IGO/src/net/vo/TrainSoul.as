/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 育魂珠信息
     */
    public class TrainSoul
    {
        /**
         * ID
         */
        public var id:uint;

        /**
         * 状态 0未开启 1开启 2培养中 3培养完成
         */
        public var state:uint;

        /**
         * 类型 1低级 2高级
         */
        public var type:uint;

        /**
         * 培育的魂精道具
         */
        public var trainItem:uint;

        /**
         * 培育开始时间（秒）
         */
        public var startTime:uint;

        /**
         * 培育结束时间（秒）
         */
        public var endTime:uint;

        /**
         * 魂精
         */
        public var soulPoint:uint;

    }
}