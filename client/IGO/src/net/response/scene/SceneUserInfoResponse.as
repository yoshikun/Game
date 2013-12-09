/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.scene
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 用户场景数据更新(5:26)
     */
    public class SceneUserInfoResponse implements IResponse
    {
        /**
         * 用户场景信息
         */
        public var info:SceneUserData;

        public function read(p:Packet):void
        {

            info = new SceneUserData();
            info.data = new UserFightData();
            info.data.userID = p.readUnsignedInt();
            info.data.nickName = p.readMultiByte(33, "utf-8");
            info.data.caption = p.readMultiByte(33, "utf-8");
            info.data.type = p.readUnsignedByte();
            info.data.sex = p.readUnsignedByte();
            info.data.level = p.readUnsignedShort();
            info.data.pos = p.readUnsignedByte();
            info.data.moveSpeed = p.readUnsignedShort();
            info.data.attackSpeed = p.readUnsignedShort();
            info.data.adistance = p.readUnsignedShort();
            info.data.vision = p.readUnsignedShort();
            info.data.hp = p.readUnsignedInt();
            info.data.maxHP = p.readUnsignedInt();
            info.data.hpRegen = p.readUnsignedShort();
            info.data.sp = p.readUnsignedShort();
            info.data.maxSP = p.readUnsignedShort();
            info.data.spRegen = p.readUnsignedShort();
            info.data.energy = p.readUnsignedShort();
            info.data.maxEnergy = p.readUnsignedShort();
            info.data.energyRegen = p.readUnsignedShort();
            info.data.pDamage = p.readUnsignedShort();
            info.data.defence = p.readUnsignedShort();
            info.data.criDam = p.readUnsignedShort();
            info.data.criDefence = p.readUnsignedShort();
            info.data.criDamP = p.readUnsignedShort();
            info.data.suck = p.readUnsignedShort();
            info.data.rebound = p.readUnsignedShort();
            info.data.combat = p.readUnsignedInt();
            info.data.allCombat = p.readUnsignedInt();
				info.data.statesList = [];
                for(var i:int = 0; i < 16; i++){
					info.data.statesList.push(p.readUnsignedShort());
				}
            info.isHide = p.readUnsignedByte();
            info.reliveNum = p.readUnsignedByte();
        }
    }
}