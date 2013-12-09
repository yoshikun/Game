/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 日常任务
     */
    public class DailyTaskInfo
    {
        /**
         * 日常任务ID
         */
        public var baseID:uint;

        /**
         * 完成要素
         */
        public var currentRequirement:uint;

        /**
         * 状态 0可查看 1进行中 2完成
         */
        public var state:uint;

    }
}