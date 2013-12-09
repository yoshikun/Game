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
     * 道具购买(11:38)
     */
    public class BuyItemResponse implements IResponse
    {
        /**
         * 结果 0未知失败 1成功 2金钱不足 3背包空间不足 4精力点上限
         */
        public var ret:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
        }
    }
}