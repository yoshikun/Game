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
     * 道具出售(11:40)
     */
    public class SellItemResponse implements IResponse
    {
        /**
         * 结果 0未知失败 1成功 2道具不存在 3非卖品
         */
        public var ret:uint;

        /**
         * 物品唯一ID
         */
        public var itemID:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            itemID = p.readUnsignedInt();
        }
    }
}