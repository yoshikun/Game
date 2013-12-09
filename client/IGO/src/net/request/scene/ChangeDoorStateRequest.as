/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.scene
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 变更传送门状态(5:71)
     */
    public class ChangeDoorStateRequest implements IRequest
    {
        /**
         * 传送门ID
         */
        public var id:uint;
    
        public function get module():uint
        {
            return 5;
        }

        public function get action():uint
        {
            return 71;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(id);
        }
    }
}