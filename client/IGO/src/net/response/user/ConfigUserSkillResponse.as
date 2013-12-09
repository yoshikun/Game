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
     * 技能配置(2:16)
     */
    public class ConfigUserSkillResponse implements IResponse
    {
        /**
         * 武器类型 1剑 2斧 3弓
         */
        public var weaponType:uint;

        /**
         * 配置出战技能
         */
        public var configSkill:ConfigSkillInfo;

        public function read(p:Packet):void
        {

            weaponType = p.readUnsignedByte();
            configSkill = new ConfigSkillInfo();
            configSkill.mainSkill = p.readUnsignedShort();
            configSkill.normalSkill = p.readUnsignedShort();
            configSkill.specialSkill = p.readUnsignedShort();
            configSkill.greatSkill = p.readUnsignedShort();
        }
    }
}