/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.state
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 更新状态(客户端不需要发送)(8:7)
     */
    public class UpdateStateRequest implements IRequest
    {
        public function get module():int
        {
            return 8;
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