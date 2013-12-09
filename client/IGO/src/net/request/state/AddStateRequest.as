/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.state
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 请求添加状态(8:1)
     */
    public class AddStateRequest implements IRequest
    {
        /**
         * 状态id (2字节id，2字节seq)
         */
        public var stateID:uint;
    
        /**
         * 用户ID
         */
        public var userID:uint;
    
        public function get module():int
        {
            return 8;
        }

        public function get action():int
        {
            return 1;
        }

        public function write(p:Packet):void
        {
            
            p.writeShort(stateID);
            p.writeUnsignedInt(userID);
        }
    }
}