/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.hall
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 修改房间中的角色信息(4:13)
     */
    public class UpdateRoleRequest implements IRequest
    {
        /**
         * 玩家所在位置 1-8
         */
        public var pos:uint;
    
        public function get module():int
        {
            return 4;
        }

        public function get action():int
        {
            return 13;
        }

        public function write(p:Packet):void
        {
            
            p.writeByte(pos);
        }
    }
}