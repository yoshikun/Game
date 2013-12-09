/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.scene
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 胜利(5:58)
     */
    public class GameResultNotifyResponse implements IResponse
    {
        /**
         * 1 己方胜利 2敌方胜利
         */
        public var ret:uint;

        /**
         * 1胜利提示 2胜利结算
         */
        public var winFlag:uint;

        /**
         * 连胜次数
         */
        public var combo:uint;

        /**
         * 经验奖励
         */
        public var expReward:uint;

        /**
         * 额外经验奖励
         */
        public var exExpReward:uint;

        /**
         * 金币奖励
         */
        public var goldReward:uint;

        /**
         * 声望奖励
         */
        public var reputationReward:uint;

        /**
         * 贡献度
         */
        public var fundReward:uint;

        /**
         * 公会站积分
         */
        public var score:uint;

        /**
         * 英雄经验
         */
        public var npcExp:uint;

        /**
         * 通关时间 秒
         */
        public var useTime:uint;

        /**
         * 是否刷新最好成绩 0未刷新最好成绩 1刷新了个人最好 2刷新了世界最好成绩
         */
        public var newRecord:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            winFlag = p.readUnsignedByte();
            combo = p.readUnsignedShort();
            expReward = p.readUnsignedInt();
            exExpReward = p.readUnsignedInt();
            goldReward = p.readUnsignedInt();
            reputationReward = p.readUnsignedInt();
            fundReward = p.readUnsignedInt();
            score = p.readUnsignedInt();
            npcExp = p.readUnsignedInt();
            useTime = p.readUnsignedInt();
            newRecord = p.readUnsignedByte();
        }
    }
}