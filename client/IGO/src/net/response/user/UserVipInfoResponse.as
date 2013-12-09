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
     * 用户vip信息(2:52)
     */
    public class UserVipInfoResponse implements IResponse
    {
        /**
         * vip等级
         */
        public var level:uint;

        /**
         * 充值总额
         */
        public var allPay:uint;

        /**
         * 礼包领取状态 0未领取 1已领取
         */
        public var giftState:uint;

        public function read(p:Packet):void
        {

            level = p.readUnsignedByte();
            allPay = p.readUnsignedInt();
            giftState = p.readUnsignedShort();
        }
    }
}