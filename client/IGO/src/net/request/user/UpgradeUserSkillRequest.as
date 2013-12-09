/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 技能升级(2:17)
     */
    public class UpgradeUserSkillRequest implements IRequest
    {
        /**
         * 0为玩家，其他为英雄ID
         */
        public var id:uint;
    
        /**
         * 技能ID
         */
        public var skill:uint;
    
        public function get module():uint
        {
            return 2;
        }

        public function get action():uint
        {
            return 17;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(id);
            p.writeShort(skill);
        }
    }
}