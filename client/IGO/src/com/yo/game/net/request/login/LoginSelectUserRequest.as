/**
 * Copyright (c) 2012, www.yo.com All rights reserved.
 */
package com.yo.game.net.request.login
{
    import com.yo.framework.net.IRequest;
    import com.yo.game.net.vo.*;
    import com.yo.framework.net.Packet;

    /**
     * 登陆选择的角色(1:15)
     */
    public class LoginSelectUserRequest implements IRequest
    {
        /**
         * 角色ID
         */
        public var charid:uint;
    
        /**
         * 用户ID
         */
        public var accid:uint;
    
        public function get module():uint
        {
            return 1;
        }

        public function get action():uint
        {
            return 15;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(charid);
            p.writeUnsignedInt(accid);
        }
    }
}