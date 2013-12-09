/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.hall
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 队伍准备游戏(4:56)
     */
    public class TeamReadyGameRequest implements IRequest
    {
        public function get module():int
        {
            return 4;
        }

        public function get action():int
        {
            return 56;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}