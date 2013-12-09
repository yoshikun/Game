/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.mail
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 打开邮件(18:5)
     */
    public class ReqOpenMailRequest implements IRequest
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
            return 5;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(id);
        }
    }
}