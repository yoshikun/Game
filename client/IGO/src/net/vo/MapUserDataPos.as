/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 站街地图的用户信息，带坐标
     */
    public class MapUserDataPos
    {
        /**
         * 信息
         */
        public var info:MapUserData;

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
         * 技能状态列表
         */
        public var statesList:Array /* of uint */;

    }
}