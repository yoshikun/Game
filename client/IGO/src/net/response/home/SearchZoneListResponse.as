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
     * 考古区域信息(15:14)
     */
    public class SearchZoneListResponse implements IResponse
    {
        /**
         * 数量
         */
        public var num:uint;

        /**
         * 考古信息
         */
        public var infoList:Array /* of SeachZone */;

        public function read(p:Packet):void
        {

            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var seachZone:SeachZone = new SeachZone();
                seachZone.id = new SearchZoneID();
                seachZone.id.zoneID = p.readUnsignedShort();
                seachZone.id.groupID = p.readUnsignedShort();
                seachZone.state = p.readUnsignedByte();
                seachZone.startTime = p.readUnsignedInt();
                seachZone.endTime = p.readUnsignedInt();
                infoList.push(seachZone);
            }
        }
    }
}