/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.dare
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 请求PK(13:14)
     */
    public class ReqStartPkResponse implements IResponse
    {
        /**
         * 结果 0成功 1找不到玩家 2超过最大次数 3冷却CD 4未知
         */
        public var ret:uint;

        /**
         * pk玩家ID
         */
        public var userID:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            userID = p.readUnsignedInt();
        }
    }
}