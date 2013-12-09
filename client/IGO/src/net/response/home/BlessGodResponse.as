/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.home
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 祝福神像(15:36)
     */
    public class BlessGodResponse implements IResponse
    {
        /**
         * 0成功 1今日已祝福 2祝福上限 3非法
         */
        public var ret:uint;

        /**
         * 信息
         */
        public var info:GodLikeInfo;

        /**
         * 日志信息
         */
        public var log:BlessLogInfo;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            info = new GodLikeInfo();
            info.state = p.readUnsignedByte();
            info.level = p.readUnsignedShort();
            info.blessCount = p.readUnsignedShort();
            log = new BlessLogInfo();
            log.userID = p.readUnsignedInt();
            log.userName = p.readMultiByte(33, "utf-8");
            log.time = p.readUnsignedInt();
        }
    }
}