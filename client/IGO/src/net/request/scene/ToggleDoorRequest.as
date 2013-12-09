/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.scene
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 触发传送门(5:73)
     */
    public class ToggleDoorRequest implements IRequest
    {
        /**
         * 传送门ID
         */
        public var id:uint;
    
        /**
         * 0 进入 1离开
         */
        public var state:uint;
    
        public function get module():int
        {
            return 5;
        }

        public function get action():int
        {
            return 73;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(id);
            p.writeByte(state);
        }
    }
}