/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 区域事件副本
     */
    public class ZoneEventInsInfo
    {
        /**
         * 事件ID
         */
        public var eventID:uint;

        /**
         * 区域ID
         */
        public var zone:uint;

        /**
         * 副本ID
         */
        public var sceneID:uint;

        /**
         * 有效结束时间（秒）
         */
        public var endTime:uint;

        /**
         * 事件状态 0可以进行 1已完成
         */
        public var state:uint;

    }
}