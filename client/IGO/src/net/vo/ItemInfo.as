/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 物品信息
     */
    public class ItemInfo
    {
        /**
         * 物品唯一id
         */
        public var id:uint;

        /**
         * 物品类别id
         */
        public var baseID:uint;

        /**
         * 位置
         */
        public var pos:ItemLocationInfo;

        /**
         * 数量
         */
        public var num:uint;

        /**
         * 等级
         */
        public var upgrade:uint;

        /**
         *  品质（1-5分别代表 白 绿蓝 紫 红）
         */
        public var quality:uint;

        /**
         * 装备是否绑定
         */
        public var bind:uint;

        /**
         * 经验
         */
        public var exp:uint;

        /**
         * 攻击力
         */
        public var pDamage:uint;

        /**
         * 攻击力加成百分比
         */
        public var pdPercent:uint;

        /**
         * 防御力
         */
        public var defence:uint;

        /**
         * 最大生命值
         */
        public var maxHP:uint;

        /**
         * 生命恢复速度
         */
        public var resumeHP:uint;

        /**
         * 道具获得时间
         */
        public var obtainTime:uint;

        /**
         * 截止时间
         */
        public var endTime:uint;

        /**
         * 价格
         */
        public var price:uint;

        /**
         * 物品星级
         */
        public var starList:Array /* of uint */;

        /**
         * 孔
         */
        public var socketList:Array /* of SocketInfo */;

        /**
         * 固定效果
         */
        public var fixEffectList:Array /* of ItemEffect */;

        /**
         * 随机效果
         */
        public var randEffectList:Array /* of ItemEffect */;

        /**
         * 成长效果
         */
        public var growEffectList:Array /* of ItemEffect */;

        /**
         * 装备技能
         */
        public var skillList:Array /* of uint */;

    }
}