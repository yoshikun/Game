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
     * 设置格子中的物品数量(11:12)
     */
    public class RefCountItemResponse implements IResponse
    {
        /**
         * 物品唯一ID
         */
        public var itemID:uint;

        /**
         * 分裂的数量
         */
        public var num:uint;

        public function read(p:Packet):void
        {

            itemID = p.readUnsignedInt();
            num = p.readUnsignedInt();
        }
    }
}