/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.hall
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 房主踢某人离开(4:11)
     */
    public class KickUserOutroomRequest implements IRequest
    {
        /**
         * 被踢用户
         */
        public var userID:uint;
    
        public function get module():uint
        {
            return 4;
        }

        public function get action():uint
        {
            return 11;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(userID);
        }
    }
}