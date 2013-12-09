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
     * 消费抽奖(2:128)
     */
    public class ConsumeLotteryInfoResponse implements IResponse
    {
        /**
         * 领取返回 0成功 1抽奖次数不足 2活动过期 3错误
         */
        public var ret:uint;

        /**
         * 抽中的道具
         */
        public var id:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            id = p.readUnsignedInt();
        }
    }
}