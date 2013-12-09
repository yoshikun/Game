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
     * 日常任务列表(2:34)
     */
    public class DailyTaskListResponse implements IResponse
    {
        /**
         * 任务数量
         */
        public var num:uint;

        /**
         * 用户日常任务
         */
        public var infoList:Array /* of DailyTaskInfo */;

        public function read(p:Packet):void
        {

            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var dailyTaskInfo:DailyTaskInfo = new DailyTaskInfo();
                dailyTaskInfo.baseID = p.readUnsignedShort();
                dailyTaskInfo.currentRequirement = p.readUnsignedByte();
                dailyTaskInfo.state = p.readUnsignedByte();
                infoList.push(dailyTaskInfo);
            }
        }
    }
}