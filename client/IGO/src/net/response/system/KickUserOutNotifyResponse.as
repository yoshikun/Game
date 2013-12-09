/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.system
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 踢人下线(1:12)
     */
    public class KickUserOutNotifyResponse implements IResponse
    {
        /**
         * 类型 1防沉迷强制下线
         */
        public var type:uint;

        public function read(p:Packet):void
        {

            type = p.readUnsignedByte();
        }
    }
}