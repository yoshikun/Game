/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.scene
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 拾取道具(5:79)
     */
    public class PickUpItemRequest implements IRequest
    {
        /**
         * 道具唯一ID
         */
        public var id:uint;
    
        public function get module():uint
        {
            return 5;
        }

        public function get action():uint
        {
            return 79;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(id);
        }
    }
}