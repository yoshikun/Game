/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.dare
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 增加PK次数和清除冷却时间(13:16)
     */
    public class ReqUpdateCountAndCdResponse implements IResponse
    {
        /**
         * 结果 0成功 1钱不足 2达到购买上限 3未知
         */
        public var ret:uint;

        /**
         * 1 加次数 2清CD
         */
        public var type:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            type = p.readUnsignedByte();
        }
    }
}