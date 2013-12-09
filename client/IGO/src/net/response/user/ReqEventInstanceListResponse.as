/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.user
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 请求事件副本信息(2:114)
     */
    public class ReqEventInstanceListResponse implements IResponse
    {
        /**
         * 数量
         */
        public var num:uint;

        /**
         * 区域事件副本
         */
        public var infoList:Array /* of ZoneEventInsInfo */;

        public function read(p:Packet):void
        {

            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var zoneEventInsInfo:ZoneEventInsInfo = new ZoneEventInsInfo();
                zoneEventInsInfo.eventID = p.readUnsignedInt();
                zoneEventInsInfo.zone = p.readUnsignedInt();
                zoneEventInsInfo.sceneID = p.readUnsignedInt();
                zoneEventInsInfo.endTime = p.readUnsignedInt();
                zoneEventInsInfo.state = p.readUnsignedByte();
                infoList.push(zoneEventInsInfo);
            }
        }
    }
}