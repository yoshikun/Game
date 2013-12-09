/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.home
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 祝福神像(15:35)
     */
    public class BlessGodRequest implements IRequest
    {
        public function get module():int
        {
            return 15;
        }

        public function get action():int
        {
            return 35;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}