/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.mail
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 新邮件提示(18:11)
     */
    public class NotifyNewMailRequest implements IRequest
    {
        public function get module():int
        {
            return 18;
        }

        public function get action():int
        {
            return 11;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}