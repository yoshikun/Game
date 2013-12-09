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
     * 消费信息(2:126)
     */
    public class UserConsumeInfoResponse implements IResponse
    {
        /**
         * 活动消费金额
         */
        public var money:uint;

        /**
         * 剩余抽奖次数
         */
        public var count:uint;

        public function read(p:Packet):void
        {

            money = p.readUnsignedInt();
            count = p.readUnsignedShort();
        }
    }
}