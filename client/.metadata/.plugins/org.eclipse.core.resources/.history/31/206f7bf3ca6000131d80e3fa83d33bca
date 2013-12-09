/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.user
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 累计登录信息(2:130)
     */
    public class ActiveLoginInfoResponse implements IResponse
    {
        /**
         * 累计登录天数
         */
        public var count:uint;

        public function read(p:Packet):void
        {

            count = p.readUnsignedShort();
        }
    }
}