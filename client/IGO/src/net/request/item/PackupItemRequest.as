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
        public function get module():uint
        {
            return 11;
        }

        public function get action():uint
        {
            return 15;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}