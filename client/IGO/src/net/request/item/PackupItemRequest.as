/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.item
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 整理背包(11:15)
     */
    public class PackupItemRequest implements IRequest
    {
        public function get module():int
        {
            return 11;
        }

        public function get action():int
        {
            return 15;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}