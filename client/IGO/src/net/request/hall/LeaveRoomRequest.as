/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.hall
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 离开房间(4:9)
     */
    public class LeaveRoomRequest implements IRequest
    {
        public function get module():int
        {
            return 4;
        }

        public function get action():int
        {
            return 9;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}