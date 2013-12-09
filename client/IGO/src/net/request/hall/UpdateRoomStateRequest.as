/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.hall
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 更新房间状态(4:40)
     */
    public class UpdateRoomStateRequest implements IRequest
    {
        public function get module():int
        {
            return 4;
        }

        public function get action():int
        {
            return 40;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}