/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 探索信息
     */
    public class SeachZone
    {
        /**
         * ID
         */
        public var id:SearchZoneID;

        /**
         * 状态 0未探索 1探索中 2探索结果
         */
        public var state:uint;

        /**
         * 探索开始时间（秒）
         */
        public var startTime:uint;

        /**
         * 探索结束时间（秒）
         */
        public var endTime:uint;

    }
}