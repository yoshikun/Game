/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.home
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 偷取魂晶(15:43)
     */
    public class ReqStealSoulRequest implements IRequest
    {
        public function get module():uint
        {
            return 15;
        }

        public function get action():uint
        {
            return 43;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}