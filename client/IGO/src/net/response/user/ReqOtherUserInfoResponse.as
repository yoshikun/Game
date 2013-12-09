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
     * 查询其他角色信息(2:30)
     */
    public class ReqOtherUserInfoResponse implements IResponse
    {
        /**
         * 角色信息
         */
        public var base:MainUserData;

        /**
         * 已装备的物品数量
         */
        public var num:uint;

        /**
         * 物品数据
         */
        public var infoList:Array /* of ItemInfo */;

        public function read(p:Packet):void
        {

            base = new MainUserData();
            base.userID = p.readUnsignedInt();
            base.nickName = p.readMultiByte(33, "utf-8");
            base.captionName = p.readMultiByte(33, "utf-8");
            base.accid = p.readUnsignedInt();
            base.type = p.readUnsignedByte();
            base.level = p.readUnsignedShort();
            base.sex = p.readUnsignedByte();
            base.state = p.readUnsignedByte();
            base.bitMask = p.readUnsignedInt();
            base.exp = p.readUnsignedInt();
            base.reputation = p.readUnsignedInt();
            base.winWars = p.readUnsignedInt();
            base.flees = p.readUnsignedInt();
            base.allWars = p.readUnsignedInt();
            base.forbidTalk = p.readUnsignedInt();
            base.onlineTime = p.readUnsignedInt();
            base.offlineTime = p.readUnsignedInt();
            base.money = p.readUnsignedInt();
            base.gold = p.readUnsignedInt();
            base.ticket = p.readUnsignedInt();
            base.soulPoint = p.readUnsignedInt();
            base.soulEnergy = p.readUnsignedInt();
            base.vigour = p.readUnsignedInt();
            base.maxVigour = p.readUnsignedInt();
            base.vip = p.readUnsignedByte();
            base.accPriv = p.readUnsignedInt();
            base.unionID = p.readUnsignedInt();
            base.unionName = p.readMultiByte(33, "utf-8");
            base.cityID = p.readUnsignedInt();
            base.x = p.readUnsignedInt();
            base.y = p.readUnsignedInt();
            base.guide = p.readUnsignedInt();
            base.moveSpeed = p.readUnsignedShort();
            base.attackSpeed = p.readUnsignedShort();
            base.adistance = p.readUnsignedShort();
            base.vision = p.readUnsignedShort();
            base.hp = p.readUnsignedInt();
            base.maxHP = p.readUnsignedInt();
            base.hpRegen = p.readUnsignedShort();
            base.sp = p.readUnsignedShort();
            base.maxSP = p.readUnsignedShort();
            base.spRegen = p.readUnsignedShort();
            base.energy = p.readUnsignedShort();
            base.maxEnergy = p.readUnsignedShort();
            base.energyRegen = p.readUnsignedShort();
            base.pDamage = p.readUnsignedShort();
            base.defence = p.readUnsignedShort();
            base.criDam = p.readUnsignedShort();
            base.criDefence = p.readUnsignedShort();
            base.criDamP = p.readUnsignedShort();
            base.suck = p.readUnsignedShort();
            base.rebound = p.readUnsignedShort();
            base.combat = p.readUnsignedInt();
            base.allCombat = p.readUnsignedInt();
            base.dayObtainExp = p.readUnsignedInt();
            base.isAntiAddiction = p.readUnsignedByte();
            base.buyVigourLeft = p.readUnsignedInt();
            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var itemInfo:ItemInfo = new ItemInfo();
                itemInfo.id = p.readUnsignedInt();
                itemInfo.baseID = p.readUnsignedInt();
                itemInfo.pos = new ItemLocationInfo();
                itemInfo.pos.locationType = p.readUnsignedInt();
                itemInfo.pos.tableID = p.readUnsignedInt();
                itemInfo.pos.column = p.readUnsignedShort();
                itemInfo.pos.row = p.readUnsignedShort();
                itemInfo.num = p.readUnsignedInt();
                itemInfo.upgrade = p.readUnsignedByte();
                itemInfo.quality = p.readUnsignedByte();
                itemInfo.bind = p.readUnsignedByte();
                itemInfo.exp = p.readUnsignedInt();
                itemInfo.pDamage = p.readUnsignedShort();
                itemInfo.pdPercent = p.readUnsignedShort();
                itemInfo.defence = p.readUnsignedShort();
                itemInfo.maxHP = p.readUnsignedInt();
                itemInfo.resumeHP = p.readUnsignedShort();
                itemInfo.obtainTime = p.readUnsignedInt();
                itemInfo.endTime = p.readUnsignedInt();
                itemInfo.price = p.readUnsignedInt();
				itemInfo.starList = [];
                for(var j:int = 0; j < 10; j++){
					itemInfo.starList.push(p.readUnsignedInt());
      	       }
				itemInfo.socketList = [];
                for(var k:int = 0; k < 6; k++){
                	var infoSocketInfo:SocketInfo = new SocketInfo();
                	infoSocketInfo.type = p.readUnsignedByte();
                	infoSocketInfo.itemID = p.readUnsignedInt();
					infoSocketInfo.fixEffectList = [];
                	for(var m:int = 0; m < 5; m++){
                		var itemEffect:ItemEffect = new ItemEffect();
						itemEffect.type = p.readUnsignedByte();
						itemEffect.id = p.readUnsignedShort();
						itemEffect.value = p.readUnsignedInt();
						infoSocketInfo.fixEffectList.push(itemEffect);
					}
					infoSocketInfo.skillList = [];
                	for(var n:int = 0; n < 3; n++){
						infoSocketInfo.skillList.push(p.readUnsignedShort());
					}
                	itemInfo.socketList.push(infoSocketInfo)
      	       }
				itemInfo.fixEffectList = [];
                for(var x:int = 0; x < 5; x++){
                	var infoItemEffect:ItemEffect = new ItemEffect();
                	infoItemEffect.type = p.readUnsignedByte();
                	infoItemEffect.id = p.readUnsignedShort();
                	infoItemEffect.value = p.readUnsignedInt();
                	itemInfo.fixEffectList.push(infoItemEffect)
      	       }
				itemInfo.randEffectList = [];
                for(var y:int = 0; y < 5; y++){
                	var infoItemEffect:ItemEffect = new ItemEffect();
                	infoItemEffect.type = p.readUnsignedByte();
                	infoItemEffect.id = p.readUnsignedShort();
                	infoItemEffect.value = p.readUnsignedInt();
                	itemInfo.randEffectList.push(infoItemEffect)
      	       }
				itemInfo.growEffectList = [];
                for(var z:int = 0; z < 5; z++){
                	var infoItemEffect:ItemEffect = new ItemEffect();
                	infoItemEffect.type = p.readUnsignedByte();
                	infoItemEffect.id = p.readUnsignedShort();
                	infoItemEffect.value = p.readUnsignedInt();
                	itemInfo.growEffectList.push(infoItemEffect)
      	       }
				itemInfo.skillList = [];
                for(var a:int = 0; a < 3; a++){
					itemInfo.skillList.push(p.readUnsignedShort());
      	       }
                infoList.push(itemInfo);
            }
        }
    }
}