/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 刷新当前区域的悬赏副本(2:85)
     */
    public class RefreshRewardInstanceRequest implements IRequest
    {
        /**
         * 0手动刷新 1购买次数
         */
        public var type:uint;
    
        public function get module():uint
        {
            return 2;
        }

        public function get action():uint
        {
            return 85;
        }

        public function write(p:Packet):void
        {
            
            p.writeByte(type);
        }
    }
}