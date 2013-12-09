/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.time
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 客户端登录时或客户端时间不对时发送(3:2)
     */
    public class TimeResponse implements IResponse
    {
        /**
         * 服务器当前秒数
         */
        public var sec:uint;

        /**
         * 服务器当前毫秒数
         */
        public var msec:uint;

        public function read(p:Packet):void
        {

            sec = p.readUnsignedInt();
            msec = p.readUnsignedInt();
        }
    }
}