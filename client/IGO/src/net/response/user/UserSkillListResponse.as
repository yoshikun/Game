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
     * 玩家技能列表(2:12)
     */
    public class UserSkillListResponse implements IResponse
    {
        /**
         * 配置出战技能数组
         */
        public var configSkillList:Array /* of ConfigSkillInfo */;

        /**
         * 数量
         */
        public var num:uint;

        /**
         * 技能信息
         */
        public var infoList:Array /* of SkillInfo */;

        public function read(p:Packet):void
        {

			configSkillList = [];
            for(var i:int = 0; i < 3; i++){
                var configSkillInfo:ConfigSkillInfo = new ConfigSkillInfo();
                configSkillInfo.mainSkill = p.readUnsignedShort();
                configSkillInfo.normalSkill = p.readUnsignedShort();
                configSkillInfo.specialSkill = p.readUnsignedShort();
                configSkillInfo.greatSkill = p.readUnsignedShort();
                configSkillList.push(configSkillInfo);
            }
            num = p.readUnsignedShort();
			infoList = [];
            for(var j:int = 0; j < num; j++){
                var skillInfo:SkillInfo = new SkillInfo();
                skillInfo.baseID = p.readUnsignedShort();
                skillInfo.level = p.readUnsignedShort();
                skillInfo.uplevel = p.readUnsignedShort();
                infoList.push(skillInfo);
            }
        }
    }
}