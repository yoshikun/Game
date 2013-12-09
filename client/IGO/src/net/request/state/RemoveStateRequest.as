/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.state
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 请求删除状态(8:5)
     */
    public class RemoveStateRequest implements IRequest
    {
        /**
         * 状态id
         */
        public var stateID:uint;
    
        public function get module():int
        {
            return 8;
        }

        public function get action():int
        {
            return 5;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(stateID);
        }
    }
}