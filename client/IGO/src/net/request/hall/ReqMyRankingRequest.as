/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.hall
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 请求我的排行榜排行(4:36)
     */
    public class ReqMyRankingRequest implements IRequest
    {
        /**
         * 排行榜类型 0等级 1财富 2战斗力
         */
        public var type:uint;
    
        public function get module():int
        {
            return 4;
        }

        public function get action():int
        {
            return 36;
        }

        public function write(p:Packet):void
        {
            
            p.writeByte(type);
        }
    }
}