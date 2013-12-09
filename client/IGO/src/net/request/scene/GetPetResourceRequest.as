/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.scene
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 拾取资源塔资源(5:63)
     */
    public class GetPetResourceRequest implements IRequest
    {
        /**
         * 拾取资源的ID
         */
        public var guid:GUID;
    
        public function get module():int
        {
            return 5;
        }

        public function get action():int
        {
            return 63;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(guid.id);
            p.writeByte(guid.type);
        }
    }
}