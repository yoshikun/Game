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
     * 领取礼包内容(11:46)
     */
    public class GetGiftPackItemResponse implements IResponse
    {
        /**
         * 结果 0未知失败 1成功 2找不到该礼包
         */
        public var ret:uint;

        /**
         * 礼包ID
         */
        public var id:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            id = p.readUnsignedInt();
        }
    }
}