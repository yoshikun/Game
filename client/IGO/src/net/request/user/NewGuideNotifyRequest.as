/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 新手引导开启通知(2:53)
     */
    public class NewGuideNotifyRequest implements IRequest
    {
        public function get module():uint
        {
            return 2;
        }

        public function get action():uint
        {
            return 53;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}