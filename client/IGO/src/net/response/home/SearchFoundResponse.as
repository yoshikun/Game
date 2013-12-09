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
     * 考古发现(15:18)
     */
    public class SearchFoundResponse implements IResponse
    {
        /**
         * 0成功 1未发现
         */
        public var ret:uint;

        /**
         * 考古信息
         */
        public var info:SeachZone;

        /**
         * 道具信息
         */
        public var itemInfo:ItemNumInfo;

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
            itemInfo = new ItemNumInfo();
            itemInfo.id = p.readUnsignedInt();
            itemInfo.num = p.readUnsignedInt();
        }
    }
}