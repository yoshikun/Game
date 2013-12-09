/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 赛跑活动状态(2:147)
     */
    public class NpcRaceStateRequest implements IRequest
    {
        public function get module():int
        {
            return 2;
        }

        public function get action():int
        {
            return 147;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}