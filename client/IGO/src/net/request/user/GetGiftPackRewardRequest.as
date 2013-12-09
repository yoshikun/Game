/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 领取礼包奖励(2:133)
     */
    public class GetGiftPackRewardRequest implements IRequest
    {
        /**
         * 奖励ID
         */
        public var id:uint;
    
        public function get module():int
        {
            return 2;
        }

        public function get action():int
        {
            return 133;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(id);
        }
    }
}