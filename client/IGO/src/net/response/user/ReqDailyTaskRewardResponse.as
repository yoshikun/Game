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
     * 日常任务领奖(2:40)
     */
    public class ReqDailyTaskRewardResponse implements IResponse
    {
        /**
         * 1成功 2未满足条件
         */
        public var ret:uint;

        /**
         * 日常任务领奖信息
         */
        public var info:DailyTaskReward;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            info = new DailyTaskReward();
            info.id = p.readUnsignedShort();
            info.state = p.readUnsignedByte();
        }
    }
}