/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.union
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 请求申请者列表(7:15)
     */
    public class ApplyListRequest implements IRequest
    {
        public function get module():uint
        {
            return 7;
        }

        public function get action():uint
        {
            return 15;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}