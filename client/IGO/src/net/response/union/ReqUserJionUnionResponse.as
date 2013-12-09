/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.union
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 邀请入会(7:56)
     */
    public class ReqUserJionUnionResponse implements IResponse
    {
        /**
         * 0成功 1不在线 2已在公会 3已申请公会 4公会人已满 5对方等级不足 6错误
         */
        public var ret:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
        }
    }
}