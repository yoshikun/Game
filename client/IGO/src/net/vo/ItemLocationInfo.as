/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 物品位置信息
     */
    public class ItemLocationInfo
    {
        /**
         * 物品格子类型 0不是格子 1背包格子 2装备(符文) 7英雄装备 8英雄仓库 9出战列表
         */
        public var locationType:uint;

        /**
         * 包袱ID
         */
        public var tableID:uint;

        /**
         * 位置
         */
        public var column:uint;

        /**
         * 位置
         */
        public var row:uint;

    }
}