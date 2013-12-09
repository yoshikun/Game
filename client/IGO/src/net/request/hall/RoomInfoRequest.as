/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.hall
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 请求房间信息(4:5)
     */
    public class RoomInfoRequest implements IRequest
    {
        /**
         * 房间ID
         */
        public var roomID:uint;
    
        public function get module():int
        {
            return 4;
        }

        public function get action():int
        {
            return 5;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(roomID);
        }
    }
}