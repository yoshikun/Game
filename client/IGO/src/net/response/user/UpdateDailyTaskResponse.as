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
     * 更新日常任务(2:36)
     */
    public class UpdateDailyTaskResponse implements IResponse
    {
        /**
         * 用户日常任务
         */
        public var info:DailyTaskInfo;

        public function read(p:Packet):void
        {

            info = new DailyTaskInfo();
            info.baseID = p.readUnsignedShort();
            info.currentRequirement = p.readUnsignedByte();
            info.state = p.readUnsignedByte();
        }
    }
}