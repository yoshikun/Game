/**
 * Copyright (c) 2012, www.yo.com All rights reserved.
 */
package com.yo.game.net.request.login
{
    import com.yo.framework.net.IRequest;
    import com.yo.game.net.vo.*;
    import com.yo.framework.net.Packet;

    /**
     * 登录到网关(1:7)
     */
    public class LoginGateRequest implements IRequest
    {
        /**
         * 登陆返回的临时id
         */
        public var loginTempID:uint;
    
        /**
         * 用户ID
         */
        public var accid:uint;
    
        /**
         * 用户登录验证key
         */
        public var desKey:String;
    
        public function get module():uint
        {
            return 1;
        }

        public function get action():uint
        {
            return 7;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(loginTempID);
            p.writeUnsignedInt(accid);
            p.writeMultiBytes(desKey, 32);
        }
    }
}