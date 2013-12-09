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
     * 加入队伍(4:53)
     */
    public class EnterTeamResponse implements IResponse
    {
        /**
         * 结果 0成功 1队伍人数已满 2人物状态不对 3等级不够 4已失效 5未知错误
         */
        public var ret:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
        }
    }
}