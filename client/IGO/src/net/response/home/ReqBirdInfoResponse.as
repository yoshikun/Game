/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.home
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 查询琉璃鸟信息（五千万）(15:30)
     */
    public class ReqBirdInfoResponse implements IResponse
    {
        /**
         * 免费剩余次数
         */
        public var freeCount:uint;

        /**
         * 花钱剩余次数
         */
        public var costCount:uint;

        /**
         * buff数量
         */
        public var buff:uint;

        /**
         * 时间
         */
        public var time:uint;

        public function read(p:Packet):void
        {

            freeCount = p.readUnsignedShort();
            costCount = p.readUnsignedShort();
            buff = p.readUnsignedShort();
            time = p.readUnsignedInt();
        }
    }
}