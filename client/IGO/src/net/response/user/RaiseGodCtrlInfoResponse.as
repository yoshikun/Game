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
     * 御神器修炼(2:76)
     */
    public class RaiseGodCtrlInfoResponse implements IResponse
    {
        /**
         * 0成功 1资源不足 2满级了 3未开放 4失败
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