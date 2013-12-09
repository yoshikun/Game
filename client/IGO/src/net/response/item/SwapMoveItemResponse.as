/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.item
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 交换（移动）用户物品(11:8)
     */
    public class SwapMoveItemResponse implements IResponse
    {
        /**
         * 物品唯一ID
         */
        public var itemID:uint;

        /**
         * 物品目的位置 如果目的位置上有物品，则交换
         */
        public var info:ItemLocationInfo;

        public function read(p:Packet):void
        {

            itemID = p.readUnsignedInt();
            info = new ItemLocationInfo();
            info.locationType = p.readUnsignedInt();
            info.tableID = p.readUnsignedInt();
            info.column = p.readUnsignedShort();
            info.row = p.readUnsignedShort();
        }
    }
}