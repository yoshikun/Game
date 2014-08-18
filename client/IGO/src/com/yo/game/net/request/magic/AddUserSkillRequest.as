/**
 * Copyright (c) 2012, www.yo.com All rights reserved.
 */
package com.yo.game.net.request.magic
{
    import com.yo.framework.net.IRequest;
    import com.yo.game.net.vo.*;
    import com.yo.framework.net.Packet;

    /**
     * 添加技能及升级技能的协议(4:1)
     */
    public class AddUserSkillRequest implements IRequest
    {
        /**
         * 技能id
         */
        public var skillid:uint;
    
        public function get module():uint
        {
            return 4;
        }

        public function get action():uint
        {
            return 1;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(skillid);
        }
    }
}