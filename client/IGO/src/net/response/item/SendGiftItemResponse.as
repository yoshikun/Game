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
     * 道具赠送(11:42)
     */
    public class SendGiftItemResponse implements IResponse
    {
        /**
         * 结果 0未知失败 1成功 2金钱不足 3不是vip，没有权限
         */
        public var ret:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
        }
    }
}