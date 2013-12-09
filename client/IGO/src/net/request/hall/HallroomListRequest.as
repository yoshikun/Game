/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.hall
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 请求多人副本房间列表(4:3)
     */
    public class HallroomListRequest implements IRequest
    {
        public function get module():int
        {
            return 4;
        }

        public function get action():int
        {
            return 3;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}