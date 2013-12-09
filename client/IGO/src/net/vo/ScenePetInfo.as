/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 宠物场景信息
     */
    public class ScenePetInfo
    {
        /**
         * 数据
         */
        public var data:PetData;

        /**
         * npc临时ID
         */
        public var id:uint;

        /**
         * 主人的类型
         */
        public var masterType:uint;

        /**
         * 主人的id
         */
        public var masterID:uint;

        /**
         * x
         */
        public var x:uint;

        /**
         * y
         */
        public var y:uint;

        /**
         * 方向
         */
        public var direct:uint;

        /**
         * 是否隐藏 1隐藏 0否
         */
        public var isHide:uint;

        /**
         * 技能状态列表
         */
        public var statesList:Array /* of uint */;

    }
}