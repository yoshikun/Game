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
     * 公会抽奖返回(7:40)
     */
    public class UnionLotteryResponse implements IResponse
    {
        /**
         * 0成功 1资源不足 2次数不足 3错误
         */
        public var ret:uint;

        /**
         * 位置
         */
        public var pos:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            pos = p.readUnsignedByte();
        }
    }
}