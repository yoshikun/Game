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
     * 公会捐献返回(7:34)
     */
    public class DonateUnionParaResponse implements IResponse
    {
        /**
         * 0成功 1资源不足 2错误
         */
        public var ret:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
        }
    }
}