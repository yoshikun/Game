/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 公告数据
     */
    public class NoticePara
    {
        /**
         * id
         */
        public var id:uint;

        /**
         * 额外数值
         */
        public var data:uint;

        /**
         * 名称
         */
        public var name:String;

        /**
         * 类型 0空类型 1玩家 2道具基础ID 3npc 4数字类型 5礼包 6副本 7功能NPC 8公会 9ViewOpen 10道具唯一ID
         */
        public var type:uint;

    }
}