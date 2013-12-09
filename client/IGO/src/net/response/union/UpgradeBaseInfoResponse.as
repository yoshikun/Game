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
     * 升级公会基地返回(7:36)
     */
    public class UpgradeBaseInfoResponse implements IResponse
    {
        /**
         * 0成功 1资源不足 2达到最大次数 3错误
         */
        public var ret:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
        }
    }
}