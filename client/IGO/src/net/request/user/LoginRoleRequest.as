/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 登陆选择的角色ID(2:5)
     */
    public class LoginRoleRequest implements IRequest
    {
        /**
         * 角色ID
         */
        public var userID:uint;
    
        /**
         * 防沉迷标记
         */
        public var addict:uint;
    
        public function get module():int
        {
            return 2;
        }

        public function get action():int
        {
            return 5;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(userID);
            p.writeByte(addict);
        }
    }
}