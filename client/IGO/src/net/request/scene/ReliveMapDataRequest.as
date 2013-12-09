/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.scene
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 复活(5:53)
     */
    public class ReliveMapDataRequest implements IRequest
    {
        /**
         * 0不复活 1复活
         */
        public var type:uint;
    
        /**
         * 唯一ID
         */
        public var guid:GUID;
    
        public function get module():int
        {
            return 5;
        }

        public function get action():int
        {
            return 53;
        }

        public function write(p:Packet):void
        {
            
            p.writeByte(type);
            p.writeUnsignedInt(guid.id);
            p.writeByte(guid.type);
        }
    }
}