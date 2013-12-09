/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.dare
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 竞技场排行(13:7)
     */
    public class UserPkRankingRequest implements IRequest
    {
        /**
         * 1竞技场 2角斗场
         */
        public var type:uint;
    
        public function get module():int
        {
            return 13;
        }

        public function get action():int
        {
            return 7;
        }

        public function write(p:Packet):void
        {
            
            p.writeByte(type);
        }
    }
}