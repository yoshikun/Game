/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 掉落道具信息
     */
    public class MapItemData
    {
        /**
         * 掉落的道具类型 1道具 2技能
         */
        public var type:uint;

        /**
         * id
         */
        public var id:uint;

        /**
         * 道具基础ID | 技能ID
         */
        public var baseID:uint;

        /**
         * NPC像素坐标
         */
        public var npcX:uint;

        /**
         * NPC像素坐标
         */
        public var npcY:uint;

        /**
         * 道具格点坐标
         */
        public var x:uint;

        /**
         * 道具格点坐标
         */
        public var y:uint;

        /**
         * 数量
         */
        public var num:uint;

        /**
         * 掉落NPC
         */
        public var npcID:uint;

    }
}