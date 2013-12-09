/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.user
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 重置御神器(2:78)
     */
    public class ResetGodCtrlInfoResponse implements IResponse
    {
        /**
         * 0成功 1未开放 2失败
         */
        public var ret:uint;

        /**
         * 等级
         */
        public var level:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            level = p.readUnsignedByte();
        }
    }
}