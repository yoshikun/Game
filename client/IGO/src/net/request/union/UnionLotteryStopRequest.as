/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.union
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 公会抽奖停止通知(7:49)
     */
    public class UnionLotteryStopRequest implements IRequest
    {
        public function get module():uint
        {
            return 7;
        }

        public function get action():uint
        {
            return 49;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}