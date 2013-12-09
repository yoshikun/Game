/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.user
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 保留游戏掉落道具(2:68)
     */
    public class KeepGameRewardResponse implements IResponse
    {
        /**
         * 领取结果返回 0成功 1金钱不足 2错误
         */
        public var ret:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
        }
    }
}