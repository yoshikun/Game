/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 用户斗兽信息(2:109)
     */
    public class UserFightbossInfoRequest implements IRequest
    {
        public function get module():int
        {
            return 2;
        }

        public function get action():int
        {
            return 109;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}