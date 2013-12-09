/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.state
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 请求指定用户的所有状态(8:3)
     */
    public class GetUserStatesRequest implements IRequest
    {
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
            return 3;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(userID);
        }
    }
}