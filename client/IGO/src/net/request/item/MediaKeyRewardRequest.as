/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.item
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 领取媒体激活码奖励(11:69)
     */
    public class MediaKeyRewardRequest implements IRequest
    {
        /**
         * 媒体key
         */
        public var key:String;
    
        public function get module():int
        {
            return 11;
        }

        public function get action():int
        {
            return 69;
        }

        public function write(p:Packet):void
        {
            
            p.writeMultiBytes(key, 33);
        }
    }
}