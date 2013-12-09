/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 解除神之封印(2:71)
     */
    public class ReleaseGodSealRequest implements IRequest
    {
        /**
         * 解除点
         */
        public var dot:uint;
    
        public function get module():int
        {
            return 2;
        }

        public function get action():int
        {
            return 71;
        }

        public function write(p:Packet):void
        {
            
            p.writeShort(dot);
        }
    }
}