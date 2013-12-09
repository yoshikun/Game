/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net
{
	import com.yo.net.IRequest;
	import com.yo.net.Packet;
    

    /**
     * 登录到网关(1:3)
     */
    public class LoginGateRequest implements IRequest
    {
        /**
         * 用户唯一ID
         */
        public var accid:uint;
    
        /**
         * 用户登录用key
         */
        public var key:uint;
    
        public function get module():int
        {
            return 1;
        }

        public function get action():int
        {
            return 3;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(accid);
            p.writeUnsignedInt(key);
        }
    }
}