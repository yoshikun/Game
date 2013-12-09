/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.resource
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 请求宝藏列表(14:1)
     */
    public class TreasureListInfoRequest implements IRequest
    {
        public function get module():int
        {
            return 14;
        }

        public function get action():int
        {
            return 1;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}