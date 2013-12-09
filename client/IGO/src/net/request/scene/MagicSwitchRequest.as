/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.scene
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 技能开启（切换）(5:39)
     */
    public class MagicSwitchRequest implements IRequest
    {
        /**
         * 攻击编号
         */
        public var guid:GUID;
    
        /**
         * 技能id
         */
        public var skillID:uint;
    
        public function get module():uint
        {
            return 5;
        }

        public function get action():uint
        {
            return 39;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(guid.id);
            p.writeByte(guid.type);
            p.writeShort(skillID);
        }
    }
}