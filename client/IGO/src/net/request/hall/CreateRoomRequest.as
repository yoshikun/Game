/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.hall
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 创建房间(4:1)
     */
    public class CreateRoomRequest implements IRequest
    {
        /**
         * 场景ID
         */
        public var id:uint;
    
        public function get module():int
        {
            return 4;
        }

        public function get action():int
        {
            return 1;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(id);
        }
    }
}