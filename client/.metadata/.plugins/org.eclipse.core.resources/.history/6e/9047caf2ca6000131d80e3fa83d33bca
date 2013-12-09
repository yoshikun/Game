/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.item
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 解锁背包格子(11:53)
     */
    public class UnlockMainPackSpaceRequest implements IRequest
    {
        /**
         * 解锁格子数
         */
        public var num:uint;
    
        public function get module():uint
        {
            return 11;
        }

        public function get action():uint
        {
            return 53;
        }

        public function write(p:Packet):void
        {
            
            p.writeShort(num);
        }
    }
}