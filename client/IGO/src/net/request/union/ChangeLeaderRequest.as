/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.union
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 改变公会会长(7:23)
     */
    public class ChangeLeaderRequest implements IRequest
    {
        /**
         * 新会长ID
         */
        public var id:uint;
    
        public function get module():int
        {
            return 7;
        }

        public function get action():int
        {
            return 23;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(id);
        }
    }
}