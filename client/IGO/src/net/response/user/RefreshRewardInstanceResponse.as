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
     * 刷新当前区域的悬赏副本(2:86)
     */
    public class RefreshRewardInstanceResponse implements IResponse
    {
        /**
         * 0手动刷新 1购买次数
         */
        public var type:uint;

        /**
         * 结果 1成功 2次数不足 3金钱不足
         */
        public var ret:uint;

        public function read(p:Packet):void
        {

            type = p.readUnsignedByte();
            ret = p.readUnsignedByte();
        }
    }
}