/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.hall
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 快速加入游戏返回(4:25)
     */
    public class QuickJoinGameResponse implements IResponse
    {
        /**
         * 结果 0成功 1等级不够 2状态不对 3无有效房间 4时间不对 5错误
         */
        public var ret:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
        }
    }
}