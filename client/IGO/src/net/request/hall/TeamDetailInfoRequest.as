/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.hall
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 队伍信息(4:46)
     */
    public class TeamDetailInfoRequest implements IRequest
    {
        public function get module():uint
        {
            return 4;
        }

        public function get action():uint
        {
            return 46;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}