/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.dare
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 增加PK次数和清除冷却时间(13:15)
     */
    public class ReqUpdateCountAndCdRequest implements IRequest
    {
        /**
         * 1 加次数 2清CD
         */
        public var type:uint;
    
        public function get module():int
        {
            return 13;
        }

        public function get action():int
        {
            return 15;
        }

        public function write(p:Packet):void
        {
            
            p.writeByte(type);
        }
    }
}