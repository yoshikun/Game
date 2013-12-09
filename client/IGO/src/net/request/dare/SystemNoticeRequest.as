/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.dare
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 系统公告(13:29)
     */
    public class SystemNoticeRequest implements IRequest
    {
        public function get module():int
        {
            return 13;
        }

        public function get action():int
        {
            return 29;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}