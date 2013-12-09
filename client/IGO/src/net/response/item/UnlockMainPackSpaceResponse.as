/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.item
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 解锁背包格子(11:54)
     */
    public class UnlockMainPackSpaceResponse implements IResponse
    {
        /**
         * 结果 0成功 1金币不足 2其他
         */
        public var ret:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
        }
    }
}