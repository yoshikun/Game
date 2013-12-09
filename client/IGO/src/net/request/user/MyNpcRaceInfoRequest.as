/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 查询我的投注信息(2:141)
     */
    public class MyNpcRaceInfoRequest implements IRequest
    {
        public function get module():int
        {
            return 2;
        }

        public function get action():int
        {
            return 141;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}