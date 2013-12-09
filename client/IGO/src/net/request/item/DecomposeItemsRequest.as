/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.item
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 分解获得道具(11:71)
     */
    public class DecomposeItemsRequest implements IRequest
    {
        public function get module():uint
        {
            return 11;
        }

        public function get action():uint
        {
            return 71;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}