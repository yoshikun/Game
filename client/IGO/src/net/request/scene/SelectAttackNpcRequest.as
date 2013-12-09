/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.scene
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 选择出击宠物(5:33)
     */
    public class SelectAttackNpcRequest implements IRequest
    {
        /**
         * 宠物的基本id
         */
        public var baseID:uint;
    
        public function get module():int
        {
            return 5;
        }

        public function get action():int
        {
            return 33;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(baseID);
        }
    }
}