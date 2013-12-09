/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 队伍信息
     */
    public class TeamInfo
    {
        /**
         * 队伍id
         */
        public var teamID:uint;

        /**
         * 队伍名称
         */
        public var name:String;

        /**
         * 队伍平均等级
         */
        public var level:uint;

        /**
         * 游戏模式
         */
        public var mode:uint;

        /**
         * 当前人数
         */
        public var curPlayers:uint;

        /**
         * 最大人数
         */
        public var maxPlayers:uint;

        /**
         *  房主ID
         */
        public var owner:uint;

        /**
         * 房间状态0等待 1匹配 2游戏 3销毁
         */
        public var state:uint;

    }
}