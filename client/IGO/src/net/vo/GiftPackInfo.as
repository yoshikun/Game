/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 礼包信息
     */
    public class GiftPackInfo
    {
        /**
         * 礼包唯一ID
         */
        public var id:uint;

        /**
         * 送礼人昵称
         */
        public var name:String;

        /**
         * 礼包类型 1商城购买 2副本掉落打包 3VIP等级礼包 4联赛排名礼包 5VIP特权礼包 6任务完成奖励 7收集奖励 8道具补偿 9场景掉落临时背包 10家园祝福礼包 11临时背包 12系统礼包 13公会礼包 14探宝 15答题 16斗兽场 17充值 18消费 19赛跑 20公会抽奖 21首次充值
         */
        public var itemType:uint;

        /**
         * 礼包时间
         */
        public var endTime:uint;

        /**
         * 礼包道具数量
         */
        public var num:uint;

        /**
         * 道具信息
         */
        public var infoList:Array /* of ItemNumInfo */;

    }
}