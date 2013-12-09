/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.union
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 邀请入会(7:55)
     */
    public class ReqUserJionUnionRequest implements IRequest
    {
        /**
         * 被邀请者
         */
        public var name:String;
    
        public function get module():int
        {
            return 7;
        }

        public function get action():int
        {
            return 55;
        }

        public function write(p:Packet):void
        {
            
            p.writeMultiBytes(name, 33);
        }
    }
}