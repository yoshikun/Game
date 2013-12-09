/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.scene
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 强制宠物攻击目标(5:69)
     */
    public class SetTargetPetRequest implements IRequest
    {
        /**
         * 功方临时ID
         */
        public var guid:GUID;
    
        /**
         * 目标临时ID
         */
        public var targetID:GUID;
    
        public function get module():int
        {
            return 5;
        }

        public function get action():int
        {
            return 69;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(guid.id);
            p.writeByte(guid.type);
            p.writeUnsignedInt(targetID.id);
            p.writeByte(targetID.type);
        }
    }
}