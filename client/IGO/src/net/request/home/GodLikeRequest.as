/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.home
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 神像信息(15:33)
     */
    public class GodLikeRequest implements IRequest
    {
        public function get module():uint
        {
            return 15;
        }

        public function get action():uint
        {
            return 33;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}