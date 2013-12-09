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
     * 新技能添加(2:14)
     */
    public class AddUserSkillResponse implements IResponse
    {
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

            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var skillInfo:SkillInfo = new SkillInfo();
                skillInfo.baseID = p.readUnsignedShort();
                skillInfo.level = p.readUnsignedShort();
                skillInfo.uplevel = p.readUnsignedShort();
                infoList.push(skillInfo);
            }
        }
    }
}