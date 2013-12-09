/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.mail
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 获取邮件附件(18:7)
     */
    public class ReqGetItemMailRequest implements IRequest
    {
        /**
         * 邮件id
         */
        public var id:uint;
    
        public function get module():int
        {
            return 18;
        }

        public function get action():int
        {
            return 7;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(id);
        }
    }
}