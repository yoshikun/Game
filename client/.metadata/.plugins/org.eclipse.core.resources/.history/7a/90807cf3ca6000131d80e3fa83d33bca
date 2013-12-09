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
     * 取消挂机(2:140)
     */
    public class CancelHoldOnlineResponse implements IResponse
    {
        /**
         * 结果 0未知 1ok 2其他操作中断挂机
         */
        public var ret:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
        }
    }
}