/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.union
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 请求公会列表(7:1)
     */
    public class UnionListInfoRequest implements IRequest
    {
        public function get module():int
        {
            return 7;
        }

        public function get action():int
        {
            return 1;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}