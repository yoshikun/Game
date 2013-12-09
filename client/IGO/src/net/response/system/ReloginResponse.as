/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.system
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 断线重连(1:8)
     */
    public class ReloginResponse implements IResponse
    {
        /**
         * 游客用户唯一ID
         */
        public var userID:uint;

        /**
         * 结果 1成功,2找不到用户
         */
        public var result:uint;

        public function read(p:Packet):void
        {

            userID = p.readUnsignedInt();
            result = p.readUnsignedByte();
        }
    }
}