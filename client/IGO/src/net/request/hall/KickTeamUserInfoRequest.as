/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.hall
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 队伍踢出成员(4:50)
     */
    public class KickTeamUserInfoRequest implements IRequest
    {
        /**
         * 玩家ID
         */
        public var id:uint;
    
        public function get module():uint
        {
            return 4;
        }

        public function get action():uint
        {
            return 50;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(id);
        }
    }
}