/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.hall
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 队伍信息(4:47)
     */
    public class TeamDetailInfoResponse implements IResponse
    {
        /**
         * 房间信息
         */
        public var info:TeamInfo;

        /**
         * 房间里的玩家数量
         */
        public var num:uint;

        /**
         * 进入房间的用户
         */
        public var userList:Array /* of TeamUserInfo */;

        public function read(p:Packet):void
        {

            info = new TeamInfo();
            info.teamID = p.readUnsignedInt();
            info.name = p.readMultiByte(33, "utf-8");
            info.level = p.readUnsignedShort();
            info.mode = p.readUnsignedByte();
            info.curPlayers = p.readUnsignedByte();
            info.maxPlayers = p.readUnsignedByte();
            info.owner = p.readUnsignedInt();
            info.state = p.readUnsignedByte();
            num = p.readUnsignedShort();
			userList = [];
            for(var i:int = 0; i < num; i++){
                var teamUserInfo:TeamUserInfo = new TeamUserInfo();
                teamUserInfo.userObj = new SelectUserInfo();
                teamUserInfo.userObj.userID = p.readUnsignedInt();
                teamUserInfo.userObj.nickName = p.readMultiByte(33, "utf-8");
                teamUserInfo.userObj.accid = p.readUnsignedInt();
                teamUserInfo.userObj.type = p.readUnsignedByte();
                teamUserInfo.userObj.level = p.readUnsignedShort();
                teamUserInfo.userObj.sex = p.readUnsignedByte();
                teamUserInfo.userObj.bitmask = p.readUnsignedInt();
                teamUserInfo.pos = p.readUnsignedByte();
                teamUserInfo.state = p.readUnsignedByte();
				teamUserInfo.avatarList = [];
                for(var j:int = 0; j < 8; j++){
					teamUserInfo.avatarList.push(p.readUnsignedInt());
      	       }
                userList.push(teamUserInfo);
            }
        }
    }
}