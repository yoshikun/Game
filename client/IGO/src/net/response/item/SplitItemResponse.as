/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.item
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 拆分物品(11:10)
     */
    public class SplitItemResponse implements IResponse
    {
        /**
         * 物品唯一ID
         */
        public var itemID:uint;

        /**
         * 新物品的唯一ID
         */
        public var newItemID:uint;

        /**
         * 分裂的数量
         */
        public var num:uint;

        /**
         * 物品目的位置 如果目的位置上有物品，则交换
         */
        public var info:ItemLocationInfo;

        public function read(p:Packet):void
        {

            itemID = p.readUnsignedInt();
            newItemID = p.readUnsignedInt();
            num = p.readUnsignedInt();
            info = new ItemLocationInfo();
            info.locationType = p.readUnsignedInt();
            info.tableID = p.readUnsignedInt();
            info.column = p.readUnsignedShort();
            info.row = p.readUnsignedShort();
        }
    }
}