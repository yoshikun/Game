/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 房间用户信息
     */
    public class RoomUserInfo
    {
        /**
         * 角色信息
         */
        public var userObj:SelectUserInfo;

        /**
         * 玩家所在位置 1-3
         */
        public var pos:uint;

        /**
         * 0 空闲 1进入房间 2准备状态 3匹配成功 4游戏准备状态 5开始游戏
         */
        public var uState:uint;

        /**
         * 队伍 1,2
         */
        public var team:uint;

        /**
         * 时装ID
         */
        public var avatarList:Array /* of uint */;

    }
}