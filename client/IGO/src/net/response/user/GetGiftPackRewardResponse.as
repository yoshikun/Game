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
     * 领取礼包奖励(2:134)
     */
    public class GetGiftPackRewardResponse implements IResponse
    {
        /**
         * 结果 0未知 1ok 2id不存在 3已领取 4背包满 5非法
         */
        public var ret:uint;

        /**
         * 奖励ID
         */
        public var id:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            id = p.readUnsignedInt();
        }
    }
}