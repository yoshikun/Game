/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.dare
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 查询我的奖励信息(13:10)
     */
    public class ReqMyPkRewardInfoResponse implements IResponse
    {
        /**
         * 0没有奖励 1有奖励未领取 2已领取
         */
        public var state:uint;

        /**
         * 领奖时排名
         */
        public var lastRank:uint;

        /**
         * 需要领取时间
         */
        public var time:uint;

        /**
         * 金币
         */
        public var gold:uint;

        /**
         * 声望
         */
        public var reputation:uint;

        public function read(p:Packet):void
        {

            state = p.readUnsignedByte();
            lastRank = p.readUnsignedInt();
            time = p.readUnsignedInt();
            gold = p.readUnsignedInt();
            reputation = p.readUnsignedInt();
        }
    }
}