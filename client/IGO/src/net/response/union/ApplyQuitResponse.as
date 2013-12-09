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
     * 退出公会返回(7:14)
     */
    public class ApplyQuitResponse implements IResponse
    {
        /**
         * 退出公会返回 0成功 1没有公会 2是会长 3错误
         */
        public var ret:uint;

        /**
         * 0主动 1被动
         */
        public var kind:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            kind = p.readUnsignedByte();
        }
    }
}