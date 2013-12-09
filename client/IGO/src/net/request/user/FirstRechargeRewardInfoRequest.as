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
        public function get module():uint
        {
            return 2;
        }

        public function get action():uint
        {
            return 123;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}