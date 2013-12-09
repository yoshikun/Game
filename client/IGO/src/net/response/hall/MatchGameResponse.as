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
     * 匹配游戏(4:43)
     */
    public class MatchGameResponse implements IResponse
    {
        /**
         * 0匹配成功 1匹配开始 2取消匹配 3队伍状态不对 4有人未准备 5错误
         */
        public var ret:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
        }
    }
}