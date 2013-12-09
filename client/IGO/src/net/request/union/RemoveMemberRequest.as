/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.union
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 移除成员(7:25)
     */
    public class RemoveMemberRequest implements IRequest
    {
        /**
         * 移除成员ID
         */
        public var id:uint;
    
        public function get module():int
        {
            return 7;
        }

        public function get action():int
        {
            return 25;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(id);
        }
    }
}