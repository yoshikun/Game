/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.home
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 育魂珠信息(15:19)
     */
    public class TrainSoulListRequest implements IRequest
    {
        public function get module():int
        {
            return 15;
        }

        public function get action():int
        {
            return 19;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}