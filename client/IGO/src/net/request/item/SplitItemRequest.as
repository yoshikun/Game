/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.item
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 拆分物品(客户端自动减少源物品的数量)(11:9)
     */
    public class SplitItemRequest implements IRequest
    {
        /**
         * 物品唯一ID
         */
        public var itemID:uint;
    
        /**
         * 分裂的数量
         */
        public var num:uint;
    
        /**
         * 物品目的位置 如果目的位置上有物品，则交换
         */
        public var info:ItemLocationInfo;
    
        public function get module():int
        {
            return 11;
        }

        public function get action():int
        {
            return 9;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(itemID);
            p.writeUnsignedInt(num);
            p.writeUnsignedInt(info.locationType);
            p.writeUnsignedInt(info.tableID);
            p.writeShort(info.column);
            p.writeShort(info.row);
        }
    }
}