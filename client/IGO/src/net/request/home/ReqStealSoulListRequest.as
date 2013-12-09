/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.home
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 查询偷取过的好友列表(15:45)
     */
    public class ReqStealSoulListRequest implements IRequest
    {
        public function get module():int
        {
            return 15;
        }

        public function get action():int
        {
            return 45;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}