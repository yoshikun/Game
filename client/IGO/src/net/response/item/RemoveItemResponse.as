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
     * 删除道具数据(11:6)
     */
    public class RemoveItemResponse implements IResponse
    {
        /**
         * 物品唯一ID
         */
        public var itemID:uint;

        public function read(p:Packet):void
        {

            itemID = p.readUnsignedInt();
        }
    }
}