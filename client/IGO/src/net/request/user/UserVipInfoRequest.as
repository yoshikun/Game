/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 用户vip信息(2:51)
     */
    public class UserVipInfoRequest implements IRequest
    {
        public function get module():uint
        {
            return 2;
        }

        public function get action():uint
        {
            return 51;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}