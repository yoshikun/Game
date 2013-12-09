/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.mail
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 获取邮件列表(18:3)
     */
    public class ReqGetListMailRequest implements IRequest
    {
        public function get module():int
        {
            return 18;
        }

        public function get action():int
        {
            return 3;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}