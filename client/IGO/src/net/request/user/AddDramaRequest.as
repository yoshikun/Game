/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 添加剧情(2:91)
     */
    public class AddDramaRequest implements IRequest
    {
        /**
         * 剧情ID
         */
        public var id:uint;
    
        public function get module():int
        {
            return 2;
        }

        public function get action():int
        {
            return 91;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(id);
        }
    }
}