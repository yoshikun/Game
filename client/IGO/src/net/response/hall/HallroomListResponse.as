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
     * 请求多人副本房间列表(4:4)
     */
    public class HallroomListResponse implements IResponse
    {
        /**
         * 房间数
         */
        public var num:uint;

        /**
         * 房间信息
         */
        public var infoList:Array /* of HallRoomInfo */;

        public function read(p:Packet):void
        {

            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var hallRoomInfo:HallRoomInfo = new HallRoomInfo();
                hallRoomInfo.roomID = p.readUnsignedInt();
                hallRoomInfo.name = p.readMultiByte(33, "utf-8");
                hallRoomInfo.needLevel = p.readUnsignedShort();
                hallRoomInfo.mode = p.readUnsignedByte();
                hallRoomInfo.curPlayers = p.readUnsignedByte();
                hallRoomInfo.maxPlayers = p.readUnsignedByte();
                hallRoomInfo.owner = p.readUnsignedInt();
                hallRoomInfo.state = p.readUnsignedByte();
                hallRoomInfo.sceneID = p.readUnsignedInt();
                hallRoomInfo.loginType = p.readUnsignedByte();
                infoList.push(hallRoomInfo);
            }
        }
    }
}