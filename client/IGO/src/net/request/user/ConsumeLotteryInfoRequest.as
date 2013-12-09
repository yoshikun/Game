/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 消费抽奖(2:127)
     */
    public class ConsumeLotteryInfoRequest implements IRequest
    {
        public function get module():int
        {
            return 2;
        }

        public function get action():int
        {
            return 127;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}