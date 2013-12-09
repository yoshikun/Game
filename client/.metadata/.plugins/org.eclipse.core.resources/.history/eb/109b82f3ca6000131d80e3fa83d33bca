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
     * 赛跑活动状态(2:148)
     */
    public class NpcRaceStateResponse implements IResponse
    {
        /**
         * 0比赛未开始 1开始比赛 2结束比赛
         */
        public var state:uint;

        public function read(p:Packet):void
        {

            state = p.readUnsignedByte();
        }
    }
}