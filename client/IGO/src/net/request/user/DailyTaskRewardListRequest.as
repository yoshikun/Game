/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 日常任务领奖列表(2:37)
     */
    public class DailyTaskRewardListRequest implements IRequest
    {
        public function get module():int
        {
            return 2;
        }

        public function get action():int
        {
            return 37;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}