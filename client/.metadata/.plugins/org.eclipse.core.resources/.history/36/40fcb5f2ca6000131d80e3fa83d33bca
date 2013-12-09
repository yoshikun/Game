/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.dare
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 请求PK(13:13)
     */
    public class ReqStartPkRequest implements IRequest
    {
        /**
         * pk玩家ID
         */
        public var userID:uint;
    
        public function get module():uint
        {
            return 13;
        }

        public function get action():uint
        {
            return 13;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(userID);
        }
    }
}