/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 领取VIP等级礼包(2:103)
     */
    public class GetVipGiftpackRequest implements IRequest
    {
        /**
         * VIP等级
         */
        public var level:uint;
    
        public function get module():uint
        {
            return 2;
        }

        public function get action():uint
        {
            return 103;
        }

        public function write(p:Packet):void
        {
            
            p.writeByte(level);
        }
    }
}