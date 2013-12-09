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
     * 设置考古状态(15:16)
     */
    public class SetSearchStateResponse implements IResponse
    {
        /**
         * 0成功 1ID未发现 2已在考古中 3未知错误
         */
        public var ret:uint;

        /**
         * 考古信息
         */
        public var info:SeachZone;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            info = new SeachZone();
            info.id = new SearchZoneID();
            info.id.zoneID = p.readUnsignedShort();
            info.id.groupID = p.readUnsignedShort();
            info.state = p.readUnsignedByte();
            info.startTime = p.readUnsignedInt();
            info.endTime = p.readUnsignedInt();
        }
    }
}