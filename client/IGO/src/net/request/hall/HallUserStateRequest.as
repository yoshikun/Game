/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.hall
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 更新大厅中的角色状态(4:15)
     */
    public class HallUserStateRequest implements IRequest
    {
        public function get module():int
        {
            return 4;
        }

        public function get action():int
        {
            return 15;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}