/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.dare
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 限时活动参与结果(13:25)
     */
    public class EnterDareResultRequest implements IRequest
    {
        /**
         * 类型 1角斗场 2多人副本 3公会boss 4公会站
         */
        public var type:uint;
    
        public function get module():int
        {
            return 13;
        }

        public function get action():int
        {
            return 25;
        }

        public function write(p:Packet):void
        {
            
            p.writeByte(type);
        }
    }
}