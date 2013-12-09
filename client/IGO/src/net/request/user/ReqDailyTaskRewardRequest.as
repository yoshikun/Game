/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 日常任务领奖(2:39)
     */
    public class ReqDailyTaskRewardRequest implements IRequest
    {
        /**
         * 奖励ID
         */
        public var id:uint;
    
        public function get module():int
        {
            return 2;
        }

        public function get action():int
        {
            return 39;
        }

        public function write(p:Packet):void
        {
            
            p.writeShort(id);
        }
    }
}