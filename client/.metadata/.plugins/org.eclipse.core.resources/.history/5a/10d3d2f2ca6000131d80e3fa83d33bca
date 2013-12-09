/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.scene
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 攻击(5:37)
     */
    public class AttackStartRequest implements IRequest
    {
        /**
         * npc种类ID
         */
        public var baseID:uint;
    
        public function get module():uint
        {
            return 5;
        }

        public function get action():uint
        {
            return 37;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(baseID);
        }
    }
}