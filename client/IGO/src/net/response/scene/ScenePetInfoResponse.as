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
     * 宠物场景数据添加及更新(5:24)
     */
    public class ScenePetInfoResponse implements IResponse
    {
        /**
         * 个数
         */
        public var num:uint;

        /**
         * 宠物场景信息
         */
        public var infoList:Array /* of ScenePetInfo */;

        public function read(p:Packet):void
        {

            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var scenePetInfo:ScenePetInfo = new ScenePetInfo();
                scenePetInfo.data = new PetData();
                scenePetInfo.data.baseID = p.readUnsignedInt();
                scenePetInfo.data.name = p.readMultiByte(33, "utf-8");
                scenePetInfo.data.race = p.readUnsignedByte();
                scenePetInfo.data.level = p.readUnsignedShort();
                scenePetInfo.data.moveSpeed = p.readUnsignedShort();
                scenePetInfo.data.attackSpeed = p.readUnsignedShort();
                scenePetInfo.data.adistance = p.readUnsignedShort();
                scenePetInfo.data.vision = p.readUnsignedShort();
                scenePetInfo.data.hp = p.readUnsignedInt();
                scenePetInfo.data.maxHP = p.readUnsignedInt();
                scenePetInfo.data.hpRegen = p.readUnsignedShort();
                scenePetInfo.data.sp = p.readUnsignedShort();
                scenePetInfo.data.maxSP = p.readUnsignedShort();
                scenePetInfo.data.spRegen = p.readUnsignedShort();
                scenePetInfo.data.energy = p.readUnsignedShort();
                scenePetInfo.data.maxEnergy = p.readUnsignedShort();
                scenePetInfo.data.energyRegen = p.readUnsignedShort();
                scenePetInfo.data.pDamage = p.readUnsignedShort();
                scenePetInfo.data.defence = p.readUnsignedShort();
                scenePetInfo.data.criDam = p.readUnsignedShort();
                scenePetInfo.data.criDefence = p.readUnsignedShort();
                scenePetInfo.data.criDamP = p.readUnsignedShort();
                scenePetInfo.data.suck = p.readUnsignedShort();
                scenePetInfo.data.rebound = p.readUnsignedShort();
                scenePetInfo.data.combat = p.readUnsignedInt();
                scenePetInfo.data.reliveCD = p.readUnsignedShort();
                scenePetInfo.data.replaceCD = p.readUnsignedShort();
                scenePetInfo.data.skillCD = p.readShort();
                scenePetInfo.data.energyCost = p.readShort();
                scenePetInfo.data.currentExp = p.readUnsignedInt();
                scenePetInfo.data.maxExp = p.readUnsignedInt();
                scenePetInfo.data.bornSkill = p.readUnsignedShort();
				scenePetInfo.data.attackSkillsList = [];
                for(var j:int = 0; j < 3; j++){
					var dataSkillInfo:SkillInfo = new SkillInfo()
            		dataSkillInfo.baseID = p.readUnsignedShort();
            		dataSkillInfo.level = p.readUnsignedShort();
            		dataSkillInfo.uplevel = p.readUnsignedShort();
					scenePetInfo.data.attackSkillsList.push(dataSkillInfo);
				}
				scenePetInfo.data.passiveSkillsList = [];
                for(var k:int = 0; k < 5; k++){
					var dataSkillInfo:SkillInfo = new SkillInfo()
            		dataSkillInfo.baseID = p.readUnsignedShort();
            		dataSkillInfo.level = p.readUnsignedShort();
            		dataSkillInfo.uplevel = p.readUnsignedShort();
					scenePetInfo.data.passiveSkillsList.push(dataSkillInfo);
				}
                scenePetInfo.data.ai = p.readUnsignedShort();
                scenePetInfo.data.type = p.readUnsignedByte();
                scenePetInfo.data.state = p.readUnsignedByte();
                scenePetInfo.data.battleLv = p.readUnsignedShort();
                scenePetInfo.data.normalSkill = p.readUnsignedShort();
                scenePetInfo.id = p.readUnsignedInt();
                scenePetInfo.masterType = p.readUnsignedByte();
                scenePetInfo.masterID = p.readUnsignedInt();
                scenePetInfo.x = p.readUnsignedShort();
                scenePetInfo.y = p.readUnsignedShort();
                scenePetInfo.direct = p.readUnsignedByte();
                scenePetInfo.isHide = p.readUnsignedByte();
				scenePetInfo.statesList = [];
                for(var m:int = 0; m < 16; m++){
					scenePetInfo.statesList.push(p.readUnsignedShort());
      	       }
                infoList.push(scenePetInfo);
            }
        }
    }
}