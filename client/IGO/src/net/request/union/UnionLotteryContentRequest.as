/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.union
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 公会抽奖数据(7:37)
     */
    public class UnionLotteryContentRequest implements IRequest
    {
        public function get module():int
        {
            return 7;
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