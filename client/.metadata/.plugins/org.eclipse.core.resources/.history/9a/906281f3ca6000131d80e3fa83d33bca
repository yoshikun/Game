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
     * 查询我的扫荡信息(2:98)
     */
    public class MyMopUpInfoResponse implements IResponse
    {
        /**
         * 下次扫荡时间
         */
        public var nextTime:uint;

        public function read(p:Packet):void
        {

            nextTime = p.readUnsignedInt();
        }
    }
}