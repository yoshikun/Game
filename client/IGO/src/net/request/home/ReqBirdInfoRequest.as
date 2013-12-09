/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.home
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 查询琉璃鸟信息（五千万）(15:29)
     */
    public class ReqBirdInfoRequest implements IRequest
    {
        public function get module():int
        {
            return 15;
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