/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.scene
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 英雄下场通知(5:55)
     */
    public class NpcLeaveNotifyRequest implements IRequest
    {
        /**
         * 被替换下场的英雄临时id
         */
        public var id:uint;
    
        /**
         * 替换英雄临时id
         */
        public var reid:uint;
    
        public function get module():int
        {
            return 5;
        }

        public function get action():int
        {
            return 55;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(id);
            p.writeUnsignedInt(reid);
        }
    }
}