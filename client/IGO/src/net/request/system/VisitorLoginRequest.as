/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.system
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 游客登录到系统(1:5)
     */
    public class VisitorLoginRequest implements IRequest
    {
        /**
         * 客户端版本号
         */
        public var version:uint;
    
        public function get module():int
        {
            return 1;
        }

        public function get action():int
        {
            return 5;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(version);
        }
    }
}