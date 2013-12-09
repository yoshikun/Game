/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.hall
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 队伍准备游戏(4:57)
     */
    public class TeamReadyGameResponse implements IResponse
    {
        /**
         * 结果 0成功,1失败
         */
        public var ret:uint;

        /**
         * 0准备 1取消准备
         */
        public var state:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            state = p.readUnsignedByte();
        }
    }
}