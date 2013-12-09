/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.hall
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 请求公会等级排行榜(4:32)
     */
    public class UnionLevelRankingRequest implements IRequest
    {
        /**
         * 请求数据所在页面
         */
        public var num:uint;
    
        public function get module():int
        {
            return 4;
        }

        public function get action():int
        {
            return 32;
        }

        public function write(p:Packet):void
        {
            
            p.writeShort(num);
        }
    }
}