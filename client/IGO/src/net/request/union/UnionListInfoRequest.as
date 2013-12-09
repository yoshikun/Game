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
        public function get module():uint
        {
            return 7;
        }

        public function get action():uint
        {
            return 1;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}