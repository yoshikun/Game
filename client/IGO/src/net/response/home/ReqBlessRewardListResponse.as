/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.home
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 领取奖励列表(15:40)
     */
    public class ReqBlessRewardListResponse implements IResponse
    {
        /**
         * 数量
         */
        public var num:uint;

        /**
         * 信息
         */
        public var infoList:Array /* of GodLikeReward */;

        public function read(p:Packet):void
        {

            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var godLikeReward:GodLikeReward = new GodLikeReward();
                godLikeReward.id = p.readUnsignedInt();
                godLikeReward.state = p.readUnsignedByte();
                godLikeReward.reward = p.readUnsignedInt();
                infoList.push(godLikeReward);
            }
        }
    }
}