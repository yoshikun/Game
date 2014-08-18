/**
 * Copyright (c) 2012, www.yo.com All rights reserved.
 */
package com.yo.game.net.vo
{
    /*@import*/
    /**
     * 用户基本数据加状态加坐标
     */
    public class MapUserDataPosState
    {
        /**
         * 用户基本数据
         */
        public var data:UserData;

        /**
         * X坐标
         */
        public var x:uint;

        /**
         * Y坐标
         */
        public var y:uint;

        /**
         * 方向
         */
        public var dir:uint;

        /**
         * 状态个数
         */
        public var num:uint;

        /**
         * 状态列表
         */
        public var stateList:Array /* of uint */;

    }
}