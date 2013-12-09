/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 插孔数据
     */
    public class SocketInfo
    {
        /**
         * 插孔类型 1普通宝石插槽 1元素宝石插槽
         */
        public var type:uint;

        /**
         * 物品ID 0:没有孔,uint.MAX:有空没有插,其他:插有宝石
         */
        public var itemID:uint;

        /**
         * 固定效果
         */
        public var fixEffectList:Array /* of ItemEffect */;

        /**
         * 技能
         */
        public var skillList:Array /* of uint */;

    }
}