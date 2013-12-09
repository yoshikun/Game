/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.item
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 交换（移动）用户物品(11:7)
     */
    public class SwapMoveItemRequest implements IRequest
    {
        /**
         * 物品唯一ID
         */
        public var itemID:uint;
    
        /**
         * 物品目的位置 如果目的位置上有物品，则交换
         */
        public var info:ItemLocationInfo;
    
        public function get module():uint
        {
            return 11;
        }

        public function get action():uint
        {
            return 7;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(itemID);
            p.writeUnsignedInt(info.locationType);
            p.writeUnsignedInt(info.tableID);
            p.writeShort(info.column);
            p.writeShort(info.row);
        }
    }
}