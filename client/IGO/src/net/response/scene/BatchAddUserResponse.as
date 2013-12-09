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
     * 批量添加人物(5:8)
     */
    public class BatchAddUserResponse implements IResponse
    {
        /**
         * 数量
         */
        public var num:uint;

        /**
         * 信息
         */
        public var infoList:Array /* of MapUserDataPos */;

        public function read(p:Packet):void
        {

            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var mapUserDataPos:MapUserDataPos = new MapUserDataPos();
                mapUserDataPos.info = new MapUserData();
                mapUserDataPos.info.userID = p.readUnsignedInt();
                mapUserDataPos.info.nickName = p.readMultiByte(33, "utf-8");
                mapUserDataPos.info.caption = p.readMultiByte(33, "utf-8");
                mapUserDataPos.info.type = p.readUnsignedByte();
                mapUserDataPos.info.sex = p.readUnsignedByte();
                mapUserDataPos.info.level = p.readUnsignedShort();
                mapUserDataPos.info.pos = p.readUnsignedByte();
                mapUserDataPos.info.team = p.readUnsignedByte();
				mapUserDataPos.info.avatarList = [];
                for(var j:int = 0; j < 8; j++){
					mapUserDataPos.info.avatarList.push(p.readUnsignedInt());
				}
                mapUserDataPos.info.unionName = p.readMultiByte(33, "utf-8");
                mapUserDataPos.info.vip = p.readUnsignedByte();
                mapUserDataPos.info.hp = p.readUnsignedInt();
                mapUserDataPos.info.maxHP = p.readUnsignedInt();
                mapUserDataPos.info.energy = p.readUnsignedShort();
                mapUserDataPos.info.maxEnergy = p.readUnsignedShort();
                mapUserDataPos.info.moveSpeed = p.readUnsignedShort();
                mapUserDataPos.x = p.readUnsignedShort();
                mapUserDataPos.y = p.readUnsignedShort();
                mapUserDataPos.direct = p.readUnsignedByte();
				mapUserDataPos.statesList = [];
                for(var k:int = 0; k < 16; k++){
					mapUserDataPos.statesList.push(p.readUnsignedShort());
      	       }
                infoList.push(mapUserDataPos);
            }
        }
    }
}