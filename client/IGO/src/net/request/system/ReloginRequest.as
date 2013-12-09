/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.system
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 断线重连(1:7)
     */
    public class ReloginRequest implements IRequest
    {
        /**
         * 用户唯一ID
         */
        public var userID:uint;
    
        public function get module():int
        {
            return 1;
        }

        public function get action():int
        {
            return 7;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(userID);
        }
    }
}