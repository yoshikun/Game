/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 技能配置(2:15)
     */
    public class ConfigUserSkillRequest implements IRequest
    {
        /**
         * 武器类型 1剑 2斧 3弓
         */
        public var weaponType:uint;
    
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
            return 15;
        }

        public function write(p:Packet):void
        {
            
            p.writeByte(weaponType);
            p.writeShort(skill);
        }
    }
}