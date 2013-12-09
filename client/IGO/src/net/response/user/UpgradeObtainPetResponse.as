/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.user
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 小兵升级 + 转生(2:42)
     */
    public class UpgradeObtainPetResponse implements IResponse
    {
        /**
         * 1成功 2金币不足 3未满足条件
         */
        public var ret:uint;

        /**
         * 小兵信息
         */
        public var info:PetData;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            info = new PetData();
            info.baseID = p.readUnsignedInt();
            info.name = p.readMultiByte(33, "utf-8");
            info.race = p.readUnsignedByte();
            info.level = p.readUnsignedShort();
            info.moveSpeed = p.readUnsignedShort();
            info.attackSpeed = p.readUnsignedShort();
            info.adistance = p.readUnsignedShort();
            info.vision = p.readUnsignedShort();
            info.hp = p.readUnsignedInt();
            info.maxHP = p.readUnsignedInt();
            info.hpRegen = p.readUnsignedShort();
            info.sp = p.readUnsignedShort();
            info.maxSP = p.readUnsignedShort();
            info.spRegen = p.readUnsignedShort();
            info.energy = p.readUnsignedShort();
            info.maxEnergy = p.readUnsignedShort();
            info.energyRegen = p.readUnsignedShort();
            info.pDamage = p.readUnsignedShort();
            info.defence = p.readUnsignedShort();
            info.criDam = p.readUnsignedShort();
            info.criDefence = p.readUnsignedShort();
            info.criDamP = p.readUnsignedShort();
            info.suck = p.readUnsignedShort();
            info.rebound = p.readUnsignedShort();
            info.combat = p.readUnsignedInt();
            info.reliveCD = p.readUnsignedShort();
            info.replaceCD = p.readUnsignedShort();
            info.skillCD = p.readShort();
            info.energyCost = p.readShort();
            info.currentExp = p.readUnsignedInt();
            info.maxExp = p.readUnsignedInt();
            info.bornSkill = p.readUnsignedShort();
				info.attackSkillsList = [];
                for(var i:int = 0; i < 3; i++){
            	var infoSkillInfo:SkillInfo = new SkillInfo();
            	infoSkillInfo.baseID = p.readUnsignedShort();
            	infoSkillInfo.level = p.readUnsignedShort();
            	infoSkillInfo.uplevel = p.readUnsignedShort();
            	info.attackSkillsList.push(infoSkillInfo)
      	       }
				info.passiveSkillsList = [];
                for(var j:int = 0; j < 5; j++){
            	var infoSkillInfo:SkillInfo = new SkillInfo();
            	infoSkillInfo.baseID = p.readUnsignedShort();
            	infoSkillInfo.level = p.readUnsignedShort();
            	infoSkillInfo.uplevel = p.readUnsignedShort();
            	info.passiveSkillsList.push(infoSkillInfo)
      	       }
            info.ai = p.readUnsignedShort();
            info.type = p.readUnsignedByte();
            info.state = p.readUnsignedByte();
            info.battleLv = p.readUnsignedShort();
            info.normalSkill = p.readUnsignedShort();
        }
    }
}