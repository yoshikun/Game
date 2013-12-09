/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.hall
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 请求用户等级排行榜(4:26)
     */
    public class UserLevelRankingRequest implements IRequest
    {
        /**
         * 请求数据所在页面
         */
        public var num:uint;
    
        public function get module():uint
        {
            return 4;
        }

        public function get action():uint
        {
            return 26;
        }

        public function write(p:Packet):void
        {
            
            p.writeShort(num);
        }
    }
}