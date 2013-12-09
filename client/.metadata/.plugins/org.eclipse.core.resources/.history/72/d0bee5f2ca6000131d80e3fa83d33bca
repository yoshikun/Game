/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.union
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 请求公会详细信息(7:3)
     */
    public class UnionDetailInfoRequest implements IRequest
    {
        /**
         * 公会ID
         */
        public var id:uint;
    
        public function get module():uint
        {
            return 7;
        }

        public function get action():uint
        {
            return 3;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(id);
        }
    }
}