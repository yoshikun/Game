/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.home
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 拾取魂精(15:27)
     */
    public class PickUpSoulRequest implements IRequest
    {
        /**
         * ID
         */
        public var id:uint;
    
        public function get module():int
        {
            return 15;
        }

        public function get action():int
        {
            return 27;
        }

        public function write(p:Packet):void
        {
            
            p.writeShort(id);
        }
    }
}