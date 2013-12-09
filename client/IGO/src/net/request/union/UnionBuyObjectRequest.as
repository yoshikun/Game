/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.union
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 公会商店购买道具(7:41)
     */
    public class UnionBuyObjectRequest implements IRequest
    {
        /**
         * 道具ID
         */
        public var id:uint;
    
        /**
         * 道具数量
         */
        public var num:uint;
    
        public function get module():uint
        {
            return 7;
        }

        public function get action():uint
        {
            return 41;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(id);
            p.writeUnsignedInt(num);
        }
    }
}