/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.chat
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 系统公告(6:3)
     */
    public class SysNotifyRequest implements IRequest
    {
        public function get module():uint
        {
            return 6;
        }

        public function get action():uint
        {
            return 3;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}