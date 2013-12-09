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
     * 开始挂机系统(2:136)
     */
    public class HoldOnlineResponse implements IResponse
    {
        /**
         * 结果 0未知 1ok 2已在挂机中 3超出当日时长 4操作非法
         */
        public var ret:uint;

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

            ret = p.readUnsignedByte();
            exp = p.readUnsignedInt();
            gold = p.readUnsignedInt();
            time = p.readUnsignedInt();
        }
    }
}