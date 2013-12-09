/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.hall
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 进入房间(4:7)
     */
    public class EnterRoomRequest implements IRequest
    {
        /**
         * 房间ID
         */
        public var roomID:uint;
    
        /**
         * 副本ID
         */
        public var sceneID:uint;
    
        public function get module():int
        {
            return 4;
        }

        public function get action():int
        {
            return 7;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(roomID);
            p.writeUnsignedInt(sceneID);
        }
    }
}