/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 活动排行奖励通知(2:107)
     */
    public class ActivityRankRewardRequest implements IRequest
    {
        public function get module():uint
        {
            return 2;
        }

        public function get action():uint
        {
            return 107;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}