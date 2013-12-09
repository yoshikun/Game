/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.home
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 祝福日志(15:37)
     */
    public class ReqBlessLogRequest implements IRequest
    {
        public function get module():int
        {
            return 15;
        }

        public function get action():int
        {
            return 37;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}