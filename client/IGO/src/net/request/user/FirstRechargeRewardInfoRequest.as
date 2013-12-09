/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 请求领取首次充值礼包信息(2:123)
     */
    public class FirstRechargeRewardInfoRequest implements IRequest
    {
        public function get module():int
        {
            return 2;
        }

        public function get action():int
        {
            return 123;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}