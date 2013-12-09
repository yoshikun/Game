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
     * 请求刷新神之挑战模式返回(2:48)
     */
    public class RefreshGodmodeResponse implements IResponse
    {
        /**
         * 0成功 1资源不足 2未知错误
         */
        public var ret:uint;

        /**
         * 剩余有效刷新次数
         */
        public var count:uint;

        /**
         * 付费刷新次数
         */
        public var refresh:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            count = p.readUnsignedShort();
            refresh = p.readUnsignedShort();
        }
    }
}