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
     * 赛跑下注(2:146)
     */
    public class NpcRaceBetResponse implements IResponse
    {
        /**
         * 结果 0未知 1ok 2重复下注 3不在下注时间内 4金额不足
         */
        public var ret:uint;

        /**
         * 下注npc
         */
        public var npcID:uint;

        /**
         * 下注金额
         */
        public var gold:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            npcID = p.readUnsignedInt();
            gold = p.readUnsignedInt();
        }
    }
}