/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 请求活动状态信息(2:115)
     */
    public class ReqCapitalActiveStateRequest implements IRequest
    {
        public function get module():uint
        {
            return 2;
        }

        public function get action():uint
        {
            return 115;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}