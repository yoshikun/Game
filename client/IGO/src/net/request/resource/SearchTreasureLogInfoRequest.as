/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.resource
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 探宝日志(14:5)
     */
    public class SearchTreasureLogInfoRequest implements IRequest
    {
        /**
         * 1个人日志 2全局日志
         */
        public var type:uint;
    
        public function get module():int
        {
            return 14;
        }

        public function get action():int
        {
            return 5;
        }

        public function write(p:Packet):void
        {
            
            p.writeByte(type);
        }
    }
}