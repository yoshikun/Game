/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 删除角色(2:7)
     */
    public class RemoveRoleRequest implements IRequest
    {
        /**
         * 角色ID
         */
        public var userID:uint;
    
        public function get module():uint
        {
            return 2;
        }

        public function get action():uint
        {
            return 7;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(userID);
        }
    }
}