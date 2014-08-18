/**
 * Copyright (c) 2012, www.yo.com All rights reserved.
 */
package com.yo.game.net.response.magic
{
    import com.yo.framework.net.IResponse;
    import com.yo.game.net.vo.*;
    import com.yo.framework.net.Packet;

    /*@import*/

    /**
     * 添加技能及升级技能的返回(4:2)
     */
    public class AddUserSkillResponse implements IResponse
    {
        /**
         * 技能id
         */
        public var skillId:uint;

        /**
         * 技能等级
         */
        public var skillLv:uint;

        public function read(p:Packet):void
        {

            skillId = p.readUnsignedInt();
            skillLv = p.readUnsignedInt();
        }
    }
}