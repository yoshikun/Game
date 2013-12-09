/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 礼包奖励信息
     */
    public class GiftPackRewardInfo
    {
        /**
         * 礼包奖励ID
         */
        public var id:uint;

        /**
         * 状态 0不符合 1可以领 2已领取
         */
        public var state:uint;

        /**
         * 在线时长，下次领取时间
         */
        public var nextTime:uint;

    }
}