/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.item
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 领取礼包内容(11:45)
     */
    public class GetGiftPackItemRequest implements IRequest
    {
        /**
         * 礼包ID
         */
        public var id:uint;
    
        public function get module():int
        {
            return 11;
        }

        public function get action():int
        {
            return 45;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(id);
        }
    }
}