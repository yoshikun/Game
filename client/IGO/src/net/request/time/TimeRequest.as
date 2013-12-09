/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.time
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 客户端收到3.1后每60秒发送一次(3:1)
     */
    public class TimeRequest implements IRequest
    {
        /**
         * 服务器当前秒数
         */
        public var sec:uint;
    
        /**
         * 服务器当前毫秒数
         */
        public var msec:uint;
    
        public function get module():int
        {
            return 3;
        }

        public function get action():int
        {
            return 1;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(sec);
            p.writeUnsignedInt(msec);
        }
    }
}