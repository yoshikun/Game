/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.user
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 定时更新挂机信息(2:138)
     */
    public class HoldOnlineTimerResponse implements IResponse
    {
        /**
         * 当日获得经验
         */
        public var exp:uint;

        /**
         * 当日获得金币
         */
        public var gold:uint;

        /**
         * 当日挂机时长
         */
        public var time:uint;

        public function read(p:Packet):void
        {

            exp = p.readUnsignedInt();
            gold = p.readUnsignedInt();
            time = p.readUnsignedInt();
        }
    }
}