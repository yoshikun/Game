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
    
        public function get module():uint
        {
            return 2;
        }

        public function get action():uint
        {
            return 39;
        }

        public function write(p:Packet):void
        {
            
            p.writeShort(id);
        }
    }
}