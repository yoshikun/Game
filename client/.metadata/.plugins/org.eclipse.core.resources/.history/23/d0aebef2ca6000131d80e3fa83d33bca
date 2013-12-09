/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.home
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 喂食琉璃鸟(15:31)
     */
    public class FeedBirdRequest implements IRequest
    {
        /**
         * 喂食类型 1普通 2高级
         */
        public var type:uint;
    
        public function get module():uint
        {
            return 15;
        }

        public function get action():uint
        {
            return 31;
        }

        public function write(p:Packet):void
        {
            
            p.writeByte(type);
        }
    }
}