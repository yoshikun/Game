/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.union
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 公会捐献(7:33)
     */
    public class DonateUnionParaRequest implements IRequest
    {
        /**
         * 0银币 1钻石
         */
        public var type:uint;
    
        /**
         * 捐献数量
         */
        public var value:uint;
    
        public function get module():int
        {
            return 7;
        }

        public function get action():int
        {
            return 33;
        }

        public function write(p:Packet):void
        {
            
            p.writeByte(type);
            p.writeUnsignedInt(value);
        }
    }
}