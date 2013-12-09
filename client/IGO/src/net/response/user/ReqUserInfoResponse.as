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
     * 查询角色基本信息(2:10)
     */
    public class ReqUserInfoResponse implements IResponse
    {
        /**
         * 角色信息
         */
        public var info:MainUserData;

        public function read(p:Packet):void
        {

            info = new MainUserData();
            info.userID = p.readUnsignedInt();
            info.nickName = p.readMultiByte(33, "utf-8");
            info.captionName = p.readMultiByte(33, "utf-8");
            info.accid = p.readUnsignedInt();
            info.type = p.readUnsignedByte();
            info.level = p.readUnsignedShort();
            info.sex = p.readUnsignedByte();
            info.state = p.readUnsignedByte();
            info.bitMask = p.readUnsignedInt();
            info.exp = p.readUnsignedInt();
            info.reputation = p.readUnsignedInt();
            info.winWars = p.readUnsignedInt();
            info.flees = p.readUnsignedInt();
            info.allWars = p.readUnsignedInt();
            info.forbidTalk = p.readUnsignedInt();
            info.onlineTime = p.readUnsignedInt();
            info.offlineTime = p.readUnsignedInt();
            info.money = p.readUnsignedInt();
            info.gold = p.readUnsignedInt();
            info.ticket = p.readUnsignedInt();
            info.soulPoint = p.readUnsignedInt();
            info.soulEnergy = p.readUnsignedInt();
            info.vigour = p.readUnsignedInt();
            info.maxVigour = p.readUnsignedInt();
            info.vip = p.readUnsignedByte();
            info.accPriv = p.readUnsignedInt();
            info.unionID = p.readUnsignedInt();
            info.unionName = p.readMultiByte(33, "utf-8");
            info.cityID = p.readUnsignedInt();
            info.x = p.readUnsignedInt();
            info.y = p.readUnsignedInt();
            info.guide = p.readUnsignedInt();
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
            info.allCombat = p.readUnsignedInt();
            info.dayObtainExp = p.readUnsignedInt();
            info.isAntiAddiction = p.readUnsignedByte();
            info.buyVigourLeft = p.readUnsignedInt();
        }
    }
}