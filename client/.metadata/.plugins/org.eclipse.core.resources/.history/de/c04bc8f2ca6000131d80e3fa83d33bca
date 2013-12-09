/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.item
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 购买声望道具(11:63)
     */
    public class ReqBuyReputationItemRequest implements IRequest
    {
        /**
         * 声望列表ID
         */
        public var id:uint;
    
        public function get module():uint
        {
            return 11;
        }

        public function get action():uint
        {
            return 63;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(id);
        }
    }
}