/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.system
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 踢人下线(1:11)
     */
    public class KickUserOutNotifyRequest implements IRequest
    {
        public function get module():int
        {
            return 1;
        }

        public function get action():int
        {
            return 11;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}