/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.user
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 请求领取首次充值礼包信息(2:124)
     */
    public class FirstRechargeRewardInfoResponse implements IResponse
    {
        /**
         * 领取返回 0成功 1已领取 2不能领取 3错误
         */
        public var ret:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
        }
    }
}