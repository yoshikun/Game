/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.scene
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 添加人物(5:14)
     */
    public class AddUserResponse implements IResponse
    {
        /**
         * 信息
         */
        public var info:MapUserDataPos;

        public function read(p:Packet):void
        {

            info = new MapUserDataPos();
            info.info = new MapUserData();
            info.info.userID = p.readUnsignedInt();
            info.info.nickName = p.readMultiByte(33, "utf-8");
            info.info.caption = p.readMultiByte(33, "utf-8");
            info.info.type = p.readUnsignedByte();
            info.info.sex = p.readUnsignedByte();
            info.info.level = p.readUnsignedShort();
            info.info.pos = p.readUnsignedByte();
            info.info.team = p.readUnsignedByte();
				info.info.avatarList = [];
                for(var i:int = 0; i < 8; i++){
					info.info.avatarList.push(p.readUnsignedInt());
				}
            info.info.unionName = p.readMultiByte(33, "utf-8");
            info.info.vip = p.readUnsignedByte();
            info.info.hp = p.readUnsignedInt();
            info.info.maxHP = p.readUnsignedInt();
            info.info.energy = p.readUnsignedShort();
            info.info.maxEnergy = p.readUnsignedShort();
            info.info.moveSpeed = p.readUnsignedShort();
            info.x = p.readUnsignedShort();
            info.y = p.readUnsignedShort();
            info.direct = p.readUnsignedByte();
				info.statesList = [];
                for(var j:int = 0; j < 16; j++){
					info.statesList.push(p.readUnsignedShort());
      	       }
        }
    }
}