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
     * 请求领取充值回馈礼包信息(2:120)
     */
    public class ReqFeedbackGiftpackInfoResponse implements IResponse
    {
        /**
         * 领取返回 0成功 1已领取 2不能领取 3错误
         */
        public var ret:uint;

        /**
         * ID
         */
        public var id:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            id = p.readUnsignedInt();
        }
    }
}