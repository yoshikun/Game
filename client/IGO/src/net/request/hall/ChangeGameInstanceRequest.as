/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.hall
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 更换副本(4:17)
     */
    public class ChangeGameInstanceRequest implements IRequest
    {
        /**
         * 副本ID
         */
        public var id:uint;
    
        public function get module():int
        {
            return 4;
        }

        public function get action():int
        {
            return 17;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(id);
        }
    }
}