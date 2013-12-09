/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.hall
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 加入队伍(4:52)
     */
    public class EnterTeamRequest implements IRequest
    {
        /**
         * 队伍ID
         */
        public var teamID:uint;
    
        public function get module():int
        {
            return 4;
        }

        public function get action():int
        {
            return 52;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(teamID);
        }
    }
}