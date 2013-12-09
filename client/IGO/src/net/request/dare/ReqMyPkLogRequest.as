/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.dare
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 查询我的竞技日志(13:5)
     */
    public class ReqMyPkLogRequest implements IRequest
    {
        public function get module():uint
        {
            return 13;
        }

        public function get action():uint
        {
            return 5;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}