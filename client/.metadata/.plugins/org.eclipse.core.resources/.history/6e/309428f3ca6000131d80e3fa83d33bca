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
     * 购买声望道具(11:64)
     */
    public class ReqBuyReputationItemResponse implements IResponse
    {
        /**
         * 结果 0成功 1声望不足 2等级不足 3已存在 4未知
         */
        public var ret:uint;

        /**
         * 声望列表ID
         */
        public var id:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            id = p.readUnsignedInt();
        }
    }
}