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
     * 查询我的投注信息(2:142)
     */
    public class MyNpcRaceInfoResponse implements IResponse
    {
        /**
         * 投注的选手ID
         */
        public var npcID:uint;

        /**
         * 下注金额
         */
        public var gold:uint;

        /**
         * 下注时间
         */
        public var betTime:uint;

        /**
         * 0比赛未开始 1开始比赛 2结束比赛
         */
        public var state:uint;

        /**
         * 奖励金额
         */
        public var rewardGold:uint;

        /**
         * 胜利npc
         */
        public var rewardNpc:uint;

        /**
         * 比赛开始时间
         */
        public var raceStartTime:uint;

        /**
         * 比赛耗时（秒）
         */
        public var npcRaceTime:uint;

        public function read(p:Packet):void
        {

            npcID = p.readUnsignedInt();
            gold = p.readUnsignedInt();
            betTime = p.readUnsignedInt();
            state = p.readUnsignedByte();
            rewardGold = p.readUnsignedInt();
            rewardNpc = p.readUnsignedInt();
            raceStartTime = p.readUnsignedInt();
            npcRaceTime = p.readUnsignedInt();
        }
    }
}