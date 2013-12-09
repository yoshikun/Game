/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.hall
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 请求房间信息(4:6)
     */
    public class RoomInfoResponse implements IResponse
    {
        /**
         * 房间信息
         */
        public var info:HallRoomInfo;

        /**
         * 房间里的玩家数量
         */
        public var num:uint;

        /**
         * 进入房间的用户
         */
        public var userList:Array /* of RoomUserInfo */;

        public function read(p:Packet):void
        {

            info = new HallRoomInfo();
            info.roomID = p.readUnsignedInt();
            info.name = p.readMultiByte(33, "utf-8");
            info.needLevel = p.readUnsignedShort();
            info.mode = p.readUnsignedByte();
            info.curPlayers = p.readUnsignedByte();
            info.maxPlayers = p.readUnsignedByte();
            info.owner = p.readUnsignedInt();
            info.state = p.readUnsignedByte();
            info.sceneID = p.readUnsignedInt();
            info.loginType = p.readUnsignedByte();
            num = p.readUnsignedShort();
			userList = [];
            for(var i:int = 0; i < num; i++){
                var roomUserInfo:RoomUserInfo = new RoomUserInfo();
                roomUserInfo.userObj = new SelectUserInfo();
                roomUserInfo.userObj.userID = p.readUnsignedInt();
                roomUserInfo.userObj.nickName = p.readMultiByte(33, "utf-8");
                roomUserInfo.userObj.accid = p.readUnsignedInt();
                roomUserInfo.userObj.type = p.readUnsignedByte();
                roomUserInfo.userObj.level = p.readUnsignedShort();
                roomUserInfo.userObj.sex = p.readUnsignedByte();
                roomUserInfo.userObj.bitmask = p.readUnsignedInt();
                roomUserInfo.pos = p.readUnsignedByte();
                roomUserInfo.uState = p.readUnsignedByte();
                roomUserInfo.team = p.readUnsignedByte();
				roomUserInfo.avatarList = [];
                for(var j:int = 0; j < 8; j++){
					roomUserInfo.avatarList.push(p.readUnsignedInt());
      	       }
                userList.push(roomUserInfo);
            }
        }
    }
}