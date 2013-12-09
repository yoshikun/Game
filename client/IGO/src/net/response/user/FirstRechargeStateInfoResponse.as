/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.user
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 首次充值状态信息(2:122)
     */
    public class FirstRechargeStateInfoResponse implements IResponse
    {
        /**
         * 领取返回 0开放 1可领取奖励 2结束
         */
        public var state:uint;

        public function read(p:Packet):void
        {

            state = p.readUnsignedByte();
        }
    }
}