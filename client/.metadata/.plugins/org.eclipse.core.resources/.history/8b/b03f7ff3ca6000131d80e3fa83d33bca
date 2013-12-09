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
     * 领取VIP等级礼包(2:104)
     */
    public class GetVipGiftpackResponse implements IResponse
    {
        /**
         * VIP等级
         */
        public var level:uint;

        /**
         * 0成功 1失败
         */
        public var ret:uint;

        public function read(p:Packet):void
        {

            level = p.readUnsignedByte();
            ret = p.readUnsignedByte();
        }
    }
}