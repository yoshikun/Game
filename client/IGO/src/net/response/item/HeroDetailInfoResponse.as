/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.item
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 英雄详细信息(11:26)
     */
    public class HeroDetailInfoResponse implements IResponse
    {
        /**
         * 英雄所属玩家ID
         */
        public var userID:uint;

        /**
         * 动作类型 1查询返回 2添加 3更新 4删除
         */
        public var actionType:uint;

        /**
         * 数量
         */
        public var num:uint;

        /**
         * 数据
         */
        public var infoList:Array /* of HeroInfo */;

        public function read(p:Packet):void
        {

            userID = p.readUnsignedInt();
            actionType = p.readUnsignedByte();
            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var heroInfo:HeroInfo = new HeroInfo();
                heroInfo.baseID = p.readUnsignedInt();
                heroInfo.name = p.readMultiByte(33, "utf-8");
                heroInfo.race = p.readUnsignedByte();
                heroInfo.level = p.readUnsignedShort();
                heroInfo.moveSpeed = p.readUnsignedShort();
                heroInfo.attackSpeed = p.readUnsignedShort();
                heroInfo.adistance = p.readUnsignedShort();
                heroInfo.vision = p.readUnsignedShort();
                heroInfo.hp = p.readUnsignedInt();
                heroInfo.maxHP = p.readUnsignedInt();
                heroInfo.hpRegen = p.readUnsignedShort();
                heroInfo.sp = p.readUnsignedShort();
                heroInfo.maxSP = p.readUnsignedShort();
                heroInfo.spRegen = p.readUnsignedShort();
                heroInfo.energy = p.readUnsignedShort();
                heroInfo.maxEnergy = p.readUnsignedShort();
                heroInfo.energyRegen = p.readUnsignedShort();
                heroInfo.pDamage = p.readUnsignedShort();
                heroInfo.defence = p.readUnsignedShort();
                heroInfo.criDam = p.readUnsignedShort();
                heroInfo.criDefence = p.readUnsignedShort();
                heroInfo.criDamP = p.readUnsignedShort();
                heroInfo.suck = p.readUnsignedShort();
                heroInfo.rebound = p.readUnsignedShort();
                heroInfo.combat = p.readUnsignedInt();
                heroInfo.reliveCD = p.readUnsignedShort();
                heroInfo.replaceCD = p.readUnsignedShort();
                heroInfo.skillCD = p.readShort();
                heroInfo.energyCost = p.readShort();
                heroInfo.currentExp = p.readUnsignedInt();
                heroInfo.maxExp = p.readUnsignedInt();
                heroInfo.bornSkill = p.readUnsignedShort();
                heroInfo.id = p.readUnsignedInt();
                heroInfo.state = p.readUnsignedInt();
                heroInfo.quality = p.readUnsignedByte();
                heroInfo.extraAtkP = p.readUnsignedShort();
                heroInfo.ignoreDamP = p.readUnsignedShort();
                heroInfo.ignoreDam = p.readUnsignedShort();
				heroInfo.attackSkillsList = [];
                for(var j:int = 0; j < 3; j++){
                	var infoSkillInfo:SkillInfo = new SkillInfo();
                	infoSkillInfo.baseID = p.readUnsignedShort();
                	infoSkillInfo.level = p.readUnsignedShort();
                	infoSkillInfo.uplevel = p.readUnsignedShort();
                	heroInfo.attackSkillsList.push(infoSkillInfo)
      	       }
				heroInfo.passiveSkillsList = [];
                for(var k:int = 0; k < 5; k++){
                	var infoSkillInfo:SkillInfo = new SkillInfo();
                	infoSkillInfo.baseID = p.readUnsignedShort();
                	infoSkillInfo.level = p.readUnsignedShort();
                	infoSkillInfo.uplevel = p.readUnsignedShort();
                	heroInfo.passiveSkillsList.push(infoSkillInfo)
      	       }
                heroInfo.obtainTime = p.readUnsignedInt();
                heroInfo.endTime = p.readUnsignedInt();
                infoList.push(heroInfo);
            }
        }
    }
}