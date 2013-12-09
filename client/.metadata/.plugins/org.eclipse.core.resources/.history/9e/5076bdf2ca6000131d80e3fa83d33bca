/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.hall
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 请求用户财富排行榜(4:28)
     */
    public class UserWealthRankingRequest implements IRequest
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
            return 28;
        }

        public function write(p:Packet):void
        {
            
            p.writeShort(num);
        }
    }
}