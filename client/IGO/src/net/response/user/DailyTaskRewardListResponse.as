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
     * 日常任务领奖列表(2:38)
     */
    public class DailyTaskRewardListResponse implements IResponse
    {
        /**
         * 数量
         */
        public var num:uint;

        /**
         * 日常任务领奖信息
         */
        public var infoList:Array /* of DailyTaskReward */;

        public function read(p:Packet):void
        {

            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var dailyTaskReward:DailyTaskReward = new DailyTaskReward();
                dailyTaskReward.id = p.readUnsignedShort();
                dailyTaskReward.state = p.readUnsignedByte();
                infoList.push(dailyTaskReward);
            }
        }
    }
}