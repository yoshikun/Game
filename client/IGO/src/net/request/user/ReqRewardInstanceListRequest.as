/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 请求悬赏副本信息(2:83)
     */
    public class ReqRewardInstanceListRequest implements IRequest
    {
        public function get module():int
        {
            return 2;
        }

        public function get action():int
        {
            return 83;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}