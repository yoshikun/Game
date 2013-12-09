/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.user
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 技能升级(2:18)
     */
    public class UpgradeUserSkillResponse implements IResponse
    {
        /**
         * 结果 0成功 1消耗魂精不足 2玩家等级不足 3技能等级上限 4未找到该技能
         */
        public var ret:uint;

        /**
         * 0为玩家，其他为英雄ID
         */
        public var id:uint;

        /**
         * 升级前的技能ID
         */
        public var skill:uint;

        /**
         * 升级后的技能信息
         */
        public var info:SkillInfo;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            id = p.readUnsignedInt();
            skill = p.readUnsignedShort();
            info = new SkillInfo();
            info.baseID = p.readUnsignedShort();
            info.level = p.readUnsignedShort();
            info.uplevel = p.readUnsignedShort();
        }
    }
}