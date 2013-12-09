/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.item
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 道具出售(11:39)
     */
    public class SellItemRequest implements IRequest
    {
        /**
         * 物品唯一ID
         */
        public var itemID:uint;
    
        public function get module():int
        {
            return 11;
        }

        public function get action():int
        {
            return 39;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(itemID);
        }
    }
}