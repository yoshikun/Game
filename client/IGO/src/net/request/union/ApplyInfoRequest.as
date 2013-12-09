/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.union
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 请求本人申请加入公会信息(7:7)
     */
    public class ApplyInfoRequest implements IRequest
    {
        public function get module():int
        {
            return 7;
        }

        public function get action():int
        {
            return 7;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}