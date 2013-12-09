/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.mail
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 删除邮件(18:10)
     */
    public class ReqDelMailResponse implements IResponse
    {
        /**
         * 结果 0失败 1成功
         */
        public var ret:uint;

        /**
         * 邮件id
         */
        public var id:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            id = p.readUnsignedInt();
        }
    }
}