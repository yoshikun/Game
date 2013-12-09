/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 房间用户信息
     */
    public class TeamUserInfo
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
         * 玩家状态 0空闲 1在房间中 2匹配中 3在队伍中 4队伍准备中
         */
        public var state:uint;

        /**
         * 时装ID
         */
        public var avatarList:Array /* of uint */;

    }
}