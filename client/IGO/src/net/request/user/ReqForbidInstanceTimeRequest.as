/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 查询角色禁止进入副本时间(2:43)
     */
    public class ReqForbidInstanceTimeRequest implements IRequest
    {
        public function get module():int
        {
            return 2;
        }

        public function get action():int
        {
            return 43;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}