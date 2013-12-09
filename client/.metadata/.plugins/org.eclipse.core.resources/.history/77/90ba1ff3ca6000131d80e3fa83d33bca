/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.home
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 神像信息(15:34)
     */
    public class GodLikeResponse implements IResponse
    {
        /**
         * 0成功 1今日已祝福 2祝福上限 3非法
         */
        public var ret:uint;

        /**
         * 信息
         */
        public var info:GodLikeInfo;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            info = new GodLikeInfo();
            info.state = p.readUnsignedByte();
            info.level = p.readUnsignedShort();
            info.blessCount = p.readUnsignedShort();
        }
    }
}