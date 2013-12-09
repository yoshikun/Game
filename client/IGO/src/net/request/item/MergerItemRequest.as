/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.item
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 合并物品(11:11)
     */
    public class MergerItemRequest implements IRequest
    {
        /**
         * 源物品唯一ID
         */
        public var srcItemID:uint;
    
        /**
         * 目标物品唯一ID
         */
        public var dstItemID:uint;
    
        public function get module():int
        {
            return 11;
        }

        public function get action():int
        {
            return 11;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(srcItemID);
            p.writeUnsignedInt(dstItemID);
        }
    }
}