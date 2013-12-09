/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.home
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 领取祝福奖励(15:41)
     */
    public class ReqBlessRewardRequest implements IRequest
    {
        public function get module():int
        {
            return 15;
        }

        public function get action():int
        {
            return 41;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}