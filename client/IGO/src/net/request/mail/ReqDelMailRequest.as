/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.mail
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 删除邮件(18:9)
     */
    public class ReqDelMailRequest implements IRequest
    {
        /**
         * 邮件id
         */
        public var id:uint;
    
        public function get module():uint
        {
            return 18;
        }

        public function get action():uint
        {
            return 9;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(id);
        }
    }
}