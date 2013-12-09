/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.dare
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 我的活动信息(13:21)
     */
    public class ReqMyActivitisRequest implements IRequest
    {
        public function get module():int
        {
            return 13;
        }

        public function get action():int
        {
            return 21;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}