/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 科技宠物信息
     */
    public class TechPetData
    {
        /**
         * 科技id
         */
        public var techID:uint;

        /**
         * 宠物id
         */
        public var baseID:uint;

        /**
         * 状态 0激活未建造 1已生产
         */
        public var state:uint;

        /**
         * 等级
         */
        public var level:uint;

        /**
         * 所需资源
         */
        public var needResource:uint;

        /**
         * 加工时常
         */
        public var duration:uint;

    }
}