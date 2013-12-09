/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 用户斗兽奖励(2:111)
     */
    public class UserFightbossRewardRequest implements IRequest
    {
        public function get module():int
        {
            return 2;
        }

        public function get action():int
        {
            return 111;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}