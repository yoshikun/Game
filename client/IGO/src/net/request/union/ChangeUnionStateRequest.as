/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.union
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 改变公会状态(7:28)
     */
    public class ChangeUnionStateRequest implements IRequest
    {
        /**
         * 0开放 1关闭
         */
        public var state:uint;
    
        public function get module():int
        {
            return 7;
        }

        public function get action():int
        {
            return 28;
        }

        public function write(p:Packet):void
        {
            
            p.writeByte(state);
        }
    }
}